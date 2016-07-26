Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f179.google.com ([209.85.161.179]:32981 "EHLO
	mail-yw0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752550AbcGZUqh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jul 2016 16:46:37 -0400
Received: by mail-yw0-f179.google.com with SMTP id r9so32824431ywg.0
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Jul 2016 13:46:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACVxJT-YRukBirLwzeiC0agZurR28J7u2EdNo9QjQTEN_C3x8w@mail.gmail.com>
References: <CACVxJT-YRukBirLwzeiC0agZurR28J7u2EdNo9QjQTEN_C3x8w@mail.gmail.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Tue, 26 Jul 2016 13:46:35 -0700
Message-ID: <CA+r1ZhgLwF0EPP6TSGRE45J+cersjibnRZxtZyWWJhtQbZ3vdg@mail.gmail.com>
Subject: Re: Officially vetted programming languages
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, Jul 25, 2016 at 6:11 AM, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> Do I understand correctly that POSIX sh and GNU make are
> the only acceptable languages in kernel build
> (ignoring optional scripts)?

Well, Documentation/Changes mandates using GNU make (version 3.80 or
later, though 3.80 doesn't seem to work building the 4.6.4 version of
the kernel).  I don't know of a similar mandate for the shell; in
practice (as enshrined in the  top level Makefile) it's /bin/bash,
which is kind of sort of POSIX-y, except when it isn't.

The README file says Linux "aims towards POSIX and Single UNIX
Specification compliance",  which does at least suggest staying within
POSIX features of the shell.  Though POSIX shell compliance isn't
always easy to sort out, as the examples at
https://stackoverflow.com/questions/11376975/is-there-a-minimally-posix-2-compliant-shell
illustrate.

I've tried building defconfigs with alternate, POSIX-y shells:
/bin/dash worked, /bin/posh didn't, and going for broke by setting
POSIXLY_CORRECT=1 unraveled big time in a bc script in kernel/time.

-- 
Jim
