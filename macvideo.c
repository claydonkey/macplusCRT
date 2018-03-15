/*
 * The MIT License
 *
 * Copyright 2018 Hudson Trammel, Anthony Campbell <anthony@claydonkey.com>.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/* 
 * File:   macvideo.c
 * Author: Hudson Trammel, Anthony Campbell <anthony@claydonkey.com>
 *
 * Created on March 14, 2018, 8:20 PM
 
 * Drive a Mac 128/Plus/SE video output from the xvfb
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "pru.h"

#define VRAM_WIDTH 512
#define VRAM_HEIGHT 384

void vram_set(void * const vram_ptr, int x, int y, int val) {
  if (x < 0 || x >= VRAM_WIDTH)
    die("x %d", x);
  if (y < 0 || y >= VRAM_HEIGHT)
    die("y %d", y);

  // bits are read out MSB first
  const uint32_t bit = 1 << (x % 32);
  const uint8_t word = x / 32;
  volatile uint32_t * const vram = vram_ptr;

  volatile uint32_t * const p = &vram[word + y * VRAM_WIDTH / 32];
  if (val == 1)
    *p |= bit;
  else
    if (val == 0)
    *p &= ~bit;
  else
    if (val == -1)
    *p ^= bit;
  else
    die("set(%d,%d,%d)", x, y, val);

  if (0 && x < 8 && y == 0)
    printf("%d,%d, %02x => %d %p %08x\n", x, y, bit, val, p, *p);

}

//#include "holly.xbm"

int main(void) {

  pru_t * const pru = pru_init(0);

  uint32_t * const pru_cmd = pru->data_ram;
  uint8_t * const vram = pru->ddr;

  pru_gpio(0, 22, 1, 1);
  pru_gpio(0, 23, 1, 1);
  pru_gpio(0, 27, 1, 1);

  memset(vram, 0x00, VRAM_WIDTH * VRAM_HEIGHT / 8);

#if 1
  for (int y = 0; y < VRAM_HEIGHT / 2; y++) {
    for (int x = 0; x < VRAM_WIDTH; x++) {
      // Make a checkerboard
      uint8_t c = x ^ y;
      int y2 = y;
      while (y2 >>= 1) c >>= 1;

      vram_set(vram, x, y, c & 1);
    }
  }

  for (int y = VRAM_HEIGHT / 2; y < VRAM_HEIGHT; y++) {
    for (int x = 0; x < VRAM_WIDTH; x++) {
      // Make a checkerboard
      vram_set(vram, x, y, ((x^y) >> 0) & 1);
    }
  }

#if 0
  for (int x = 90; x < 200; x++)
    for (int y = 90; y < 150; y++)
      vram_set(vram, x, y, 1);
#endif

#if 0
  for (int x = 0; x < VRAM_WIDTH; x++) {
    vram_set(vram, x, 0, 1);
    vram_set(vram, x, 1, 1);
    vram_set(vram, x, VRAM_HEIGHT - 1, 1);
    vram_set(vram, x, VRAM_HEIGHT - 2, 1);
  }
  for (int y = 0; y < VRAM_HEIGHT; y++) {
    vram_set(vram, 0, y, 1);
    vram_set(vram, 1, y, 1);
    vram_set(vram, VRAM_WIDTH - 1, y, 1);
    vram_set(vram, VRAM_WIDTH - 2, y, 1);
  }
#endif

  __asm__ __volatile__("dmb");
#else
  memcpy(vram, holly_bits, VRAM_WIDTH * VRAM_HEIGHT / 8);
  for (int y = 0; y < VRAM_HEIGHT; y++) {
    for (int x = 0; x < VRAM_WIDTH; x++) {
      // invert the image
      vram_set(vram, x, y, -1);
    }
  }
#endif

  pru_exec(pru, "./macvideo.bin");
  printf("pru %p\n", pru);
  printf("cmd %p\n", pru_cmd);
  printf("ddr %p (%08x)\n", vram, pru->ddr_addr);

#if 0
  for (int y = 0; y < VRAM_HEIGHT; y++) {
    for (int x = 0; x < VRAM_WIDTH; x += 8) {
      printf("%c", vram[x / 8 + y * VRAM_WIDTH / 8] ? 'X' : '_');
    }
    printf("\n");
  }
#endif

  while (1) {
    *pru_cmd = pru->ddr_addr;
    usleep(1000);
  }

  return 0;
}
