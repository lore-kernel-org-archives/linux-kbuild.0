Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:58585 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752024Ab3ETQFy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 May 2013 12:05:54 -0400
Received: by mail-we0-f175.google.com with SMTP id p60so1563602wes.34
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2013 09:05:53 -0700 (PDT)
Date: Mon, 20 May 2013 17:57:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 1/2] scripts/config: replace hard-coded script name by a
 dynamic value
Message-ID: <20130520155729.GE3164@free.fr>
References: <cover.1368379475.git.chauplac@gmail.com>
 <9442eebf0117a0d975ca766ea84efec4ad58c6d0.1368379475.git.chauplac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <9442eebf0117a0d975ca766ea84efec4ad58c6d0.1368379475.git.chauplac@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Clement Chauplannaz <chauplac@gmail.com>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, andi@firstfloor.org

Clément, All,

On 2013-05-12 21:08 +0200, Clement Chauplannaz spake thusly:
> The script `config' prints its name in usage() function. It is currently
> hard-coded to value `config'. However, the script may be reused under
> a different name in contexts other than the Linux Kernel.
> 
> Replace the hard-coded value `config' by the name of the script at runtime.
> 
> Signed-off-by: Clement Chauplannaz <chauplac@gmail.com>

I've applied this in my tree in the branch yem-kconfig-for-next, for
inclusion upstream when the 3.11 merge window opens. Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
