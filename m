Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:56084 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752058Ab3GMRrK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 13 Jul 2013 13:47:10 -0400
Received: by mail-wi0-f174.google.com with SMTP id k10so1659142wiv.13
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Jul 2013 10:47:08 -0700 (PDT)
Date: Sat, 13 Jul 2013 19:47:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v3] scripts/config: use sed's POSIX interface
Message-ID: <20130713174704.GC3280@free.fr>
References: <1373726216-13415-1-git-send-email-chauplac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <1373726216-13415-1-git-send-email-chauplac@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Clement Chauplannaz <chauplac@gmail.com>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, ak@linux.intel.com

Clément, All,

On 2013-07-13 16:36 +0200, Clement Chauplannaz spake thusly:
> Script `config' relies on extensions of `GNU sed', and is thus not
> working on all Unixes:
>   - in-place edition of files (-i), which can be replaced with
>     a temporary file;
>   - extended-regexps (-r), which can be split into basic regexps;
>   - single-line calls to `a' command, while some implementations
>     require a leading newline before the parameter.
> 
> Rewrite calls to `sed' to comply with POSIX interface, and move them
> to helper functions.
> 
> Signed-off-by: Clement Chauplannaz <chauplac@gmail.com>

OK, I'm taking this in my -for-next branch. Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
