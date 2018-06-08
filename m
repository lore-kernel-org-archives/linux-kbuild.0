Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:59210 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752449AbeFHAHG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jun 2018 20:07:06 -0400
Subject: Re: [PATCH] uapi: Make generic uapi headers compile standalone.
References: <20180606231602.231326-1-jchowdhary@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b6b6dd56-c948-54e8-df95-3d170a3c1e7d@infradead.org>
Date: Thu, 7 Jun 2018 17:07:01 -0700
MIME-Version: 1.0
In-Reply-To: <20180606231602.231326-1-jchowdhary@google.com>
Content-Type: multipart/mixed;
 boundary="------------B62B25DCCC7D3ABB45F9F1E7"
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jayant Chowdhary <jchowdhary@google.com>, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, kernel-team@android.com, linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------B62B25DCCC7D3ABB45F9F1E7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06/06/2018 04:16 PM, Jayant Chowdhary wrote:
> In order for static analysis tools to analyze each of the uapi headers,
> we need to enable them to compile stand-alone. Some uapi headers were
> missing dependencies which would not make them compile stand-alone in
> user-land. This patch adds those dependencies.

Hi,

Thanks for getting started on this.  I see that the kbuild robot and I were
still not able to do successful builds even after this patch is applied.
We were building different targets though.  robot was doing kernel builds
and I was doing a large "all-uapi" build.

I started on my all-uapi work about 1 week ago but haven't posted anything yet,
but it's posted (attached) below.  It's not yet up to kernel quality yet (for a
Makefile), and I have made very little progress toward a successful userspace build.

If anyone is interested, just put these 3 files in <kernel_tree>/tools/build
and then run:

make ARCH=$some_arch O=build_dir headers_check
so that the headers will be cleaned up and installed in build_dir/usr/.

Then run 'make -f all-uapi.mk'
and the userspace program with all header files found in build_dir/usr/include
will be built -- i.e., attempted (not successfully).

(note: chmod +x hdr-fix-lines.pl)


-- 
~Randy

--------------B62B25DCCC7D3ABB45F9F1E7
Content-Type: text/x-makefile;
 name="all-uapi.mk"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="all-uapi.mk"

# all-uapi.mk
# currently resides in tools/build/
#
# before running 'make -f all-uapi.mk',
# run (from top of kernel tree): make ARCH=arch O=dir headers_check
# so that the uapi headers will be installed.

srctree=../..
CC=gcc

all: all-uapi.h all-uapi.o

all-uapi.h: all-uapi.mk hdr-fix-lines.pl
	rm -f all-uapi.h
	touch all-uapi.h
#	find $(srctree)/xx64/usr/include/uapi -type f | grep -v \\.orig |
	find $(srctree)/xx64/usr/include -type f | grep -v \\.orig | \
		./hdr-fix-lines.pl >>all-uapi.h

all-uapi.o: all-uapi.h
	$(CC) -I../../xx64/usr/include all-uapi.c -o all-uapi.o

--------------B62B25DCCC7D3ABB45F9F1E7
Content-Type: text/x-csrc;
 name="all-uapi.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="all-uapi.c"

// SPDX GPL 2.0
// This userspace source file pulls in all #include <uapi/*> header files
// to see what kinds of problems happen.

#include <stdio.h>
#include <stdarg.h>
#include <stdint.h>

#include <linux/posix_types.h>
#include <asm-generic/ipcbuf.h>

#include "all-uapi.h"

int main(int argc, char *argv[])
{
}

--------------B62B25DCCC7D3ABB45F9F1E7
Content-Type: application/x-perl;
 name="hdr-fix-lines.pl"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="hdr-fix-lines.pl"

#! /usr/bin/perl

# $_ is a filename like ../../include/uapi/linux/prctl.h
# convert it to be like: $include <uapi/linux/prctl.h>
# input via stdin; output to stdout.
# vi:ts=4

LINE:
	while ($line = <STDIN>) {
		chomp $line;		# drop ending newline

		# skip if not a .h file
		next LINE if ($line !~ m/\.h$/);
		# skip any /asm.*posix_types/
		next LINE if ($line =~ "asm.*posix_types");

		$line =~ s@^.*include/@#include <@;
		$line =~ s@\.h$@.h>@;

		print "$line\n";
	} ### < STDIN

--------------B62B25DCCC7D3ABB45F9F1E7--
