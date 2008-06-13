Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.231]:40772 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752392AbYFMVwy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Jun 2008 17:52:54 -0400
Received: by rv-out-0506.google.com with SMTP id k40so2745147rvb.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Jun 2008 14:52:52 -0700 (PDT)
Message-ID: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com>
Date: Fri, 13 Jun 2008 22:52:52 +0100
From: "Oleg Verych" <olecom@gmail.com>
Subject: about size optimizations (Re: Not as much ccache win as I expected)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org

>> And what kinds of source/kconfig changes are made for every build?
>
> I start with a baseline config for an embedded board, then
> alter, one at a time, individual config items related to kernel size.
> No source changes are made.

Using same `gcc -E` principle, I once had a dream to create
build with something like "whole-kernel-at-time" optimising
compiler option:

for file in $all_core_files
do gcc $opt -E $file >>core_kernel.c
done && gcc $opt code_kernel.c -o vmlinux.c.o

# same for some special parts and asm
do_foo
# do final link
do_vmlinux

I've had something like that once for `dash` and had few
percents of size reduction. It would be interesting to
implement and check this in linux.

Also i've many things to point-tune/point-remove based on
usage patterns/source patterns, which can be easily removed by
stream text editor from sources. These like     not needed
* syscalls,sysctl, ioctls
* fields in data structures/sources for handling them
* code branches or code blocks which are known (in particular
board / embedded case) to be useless etc. etc.

But all this requires non trivial source text editor or visual tools
for easy analysis, navigation, marking, RE generation and
build + run testing.

With mid-70 command line and `make` (even kbuild version)
or 20++ years old technology of text editors, it's not that trivial
to accomplish.

Some kind of IDE for kernel development is needed. Here
one will have all whitespace and code style policy, static
checks for stupid security holes, C mis-use, kernel API
mis-use, all those crutches in linux/scripts/* in one place
and applied right away.

Sorry, for this rant, but i see no developemnt here at all.
New schedulers, slab allocators, file systems are great.
But all this has nothing to do with fundamental developent
of the tools. Hardware is quite fast and have pretty much
of RAM/ROM/caches now, yet software just bloats.

The streaming, pre-cc text editing is the key, fine GCC is not.
-- 
sed 'sed && sh + olecom = love'  <<  ''
-o--=O`C
 #oo'L O
<___=E M
