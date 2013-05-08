Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:39767 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881Ab3EHVkz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 May 2013 17:40:55 -0400
Received: by mail-wg0-f46.google.com with SMTP id n12so2303650wgh.13
        for <linux-kbuild@vger.kernel.org>; Wed, 08 May 2013 14:40:54 -0700 (PDT)
Date: Wed, 8 May 2013 23:40:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v3] let lxdialog/util.c:print_autowrap() handle newline
 characters
Message-ID: <20130508214050.GG3413@free.fr>
References: <gisj1xn0un.fsf@karga.hank.lab>
 <giobclmyw3.fsf@karga.hank.lab>
 <20130508133522.GD3413@free.fr>
 <gifvxxmucf.fsf@karga.hank.lab>
 <20130508150446.GE3413@free.fr>
 <ghli7pa3rt.fsf_-_@mx10.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ghli7pa3rt.fsf_-_@mx10.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Dirk, All,

On Wed, May 08, 2013 at 05:29:42PM +0200, Dirk Gouders wrote:

> From dcaab3b8c6c9df84cba26fcc47c244932642f292 Mon Sep 17 00:00:00 2001
> From: Dirk Gouders <gouders@et.bocholt.fh-gelsenkirchen.de>
> Date: Wed, 8 May 2013 17:06:37 +0200
> Subject: [PATCH v3] When exiting menuconfig with unsaved changes, a dialog like
>  the following is shown
> 
>         Do you wish to save your new configuration ? <ESC><ESC>
>         to continue.
> 
> The author of the dialog text specified a newline and probably
> expected it to be processed, so let print_autowrap() handle newlines propperly.
> 
> Signed-off-by: Dirk Gouders <dirk@gouders.net>

I've taken this in my tree:
    git://gitorious.org/linux-kconfig/linux-kconfig.git yem-kconfig-for-next

I had to edit the commit log, as 'git am' pulled the complete mail, and
I further edited it a little teeny bit:
(The repository is unbrowseable on gitorious, but you can see the commit
here: https://www.gitorious.org/linux-kconfig/linux-kconfig/commit/87d46f0 )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
