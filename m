Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.175]:59245 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755264AbYGONUN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Jul 2008 09:20:13 -0400
Received: by wf-out-1314.google.com with SMTP id 27so5342591wfd.4
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Jul 2008 06:20:09 -0700 (PDT)
Date: Tue, 15 Jul 2008 06:20:05 -0700
Subject: Re: binutils 2.18.50.0.8 frv build error
Message-ID: <20080715132005.GA6517@lucon.org>
References: <20080715121327.GA24533@cs181140183.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080715121327.GA24533@cs181140183.pp.htv.fi>
From: "H.J. Lu" <hjl.tools@GMAIL.COM>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: dhowells@redhat.com, sam@ravnborg.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tue, Jul 15, 2008 at 03:13:27PM +0300, Adrian Bunk wrote:
> Toolchain:
> - gcc 4.3.1
> - binutils 2.18.50.0.7 and 2.18.50.0.8
> - configured for frv-linux
> - kernel 2.6.26
> 
> Builds fine when using binutils 2.18.50.0.7,
> but fails as follows with binutils 2.18.50.0.8:
> 
> <--  snip  -->
> 
> ...
>   HOSTCC  scripts/kallsyms
>   CC      init/main.o
>   CHK     include/linux/compile.h
>   UPD     include/linux/compile.h
>   CC      init/version.o
>   CC      init/do_mounts.o
>   LD      init/mounts.o
>   CC      init/noinitramfs.o
>   LD      init/built-in.o
> frv-linux-ld: init/mounts.o: compiled with -fpic and linked with modules that use non-pic relocations
> frv-linux-ld: failed to merge target specific data of file init/mounts.o
> make[2]: *** [init/built-in.o] Error 1
> 
> <--  snip  -->
> 
> Complete verbose log below.
> 
> Any hints what's going wrong?
> 
> cu
> Adrian
> 
> 

...

>    frv-linux-ld    -r -o init/built-in.o init/main.o init/version.o init/mounts.o init/noinitramfs.o 
> frv-linux-ld: init/mounts.o: compiled with -fpic and linked with modules that use non-pic relocations
> frv-linux-ld: failed to merge target specific data of file init/mounts.o
> make[1]: *** [init/built-in.o] Error 1
> make: *** [init] Error 2

This regression was introduced between 2008-05-02 10:10am and
2008-07-09 5:45pm PDT.  Does ld from binutils 2.18.50.0.7 work
on the same init/main.o init/version.o init/mounts.o
init/noinitramfs.o? If yes, please open a bug report at

http://www.sourceware.org/bugzilla/

with those .o files. If not, please find out why.

Thanks.



H.J.
