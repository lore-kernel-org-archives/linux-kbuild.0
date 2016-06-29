Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:33997 "EHLO
	mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751499AbcF2Q5E (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Jun 2016 12:57:04 -0400
MIME-Version: 1.0
In-Reply-To: <1467052107-26735-2-git-send-email-rabin@rab.in>
References: <1467052107-26735-1-git-send-email-rabin@rab.in> <1467052107-26735-2-git-send-email-rabin@rab.in>
From: Jim Davis <jim.epost@gmail.com>
Date: Wed, 29 Jun 2016 09:57:02 -0700
Message-ID: <CA+r1ZhgE3PHYU9N8yE3R2-=n7QzgApVGqueKQ8QqvQD1tj-X9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: add shell cache
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rabin Vincent <rabin@rab.in>
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Mon, Jun 27, 2016 at 11:28 AM, Rabin Vincent <rabin@rab.in> wrote:
> Running make results in over 40 invocations of the compiler just during
> processing of the Makefile, before any actual rules are run.
>
> To reduce this overhead, cache the results of $(shell) calls to the
> compiler.

Clever.   Looks like lisp with all those parens!

One quirk with distclean:

jim@krebstar:~/linux-rc$ make defconfig >/dev/null
jim@krebstar:~/linux-rc$ ls -la .shellcache
-rw-rw-r-- 1 jim jim 7876 Jun 29 09:51 .shellcache
jim@krebstar:~/linux-rc$ make distclean | grep '\.shellcache'
  CLEAN   .shellcache
jim@krebstar:~/linux-rc$ ls -la .shellcache
-rw-rw-r-- 1 jim jim 1061 Jun 29 09:52 .shellcache

-- 
Jim
