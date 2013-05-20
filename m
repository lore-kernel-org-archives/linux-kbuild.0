Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:55077 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755340Ab3ETPzS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 May 2013 11:55:18 -0400
Received: by mail-we0-f171.google.com with SMTP id t59so1004862wes.16
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2013 08:55:17 -0700 (PDT)
Date: Mon, 20 May 2013 17:55:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 2/2] scripts/config: fix assignment of parameters for
 short version of --*-after options
Message-ID: <20130520155512.GD3164@free.fr>
References: <cover.1368379475.git.chauplac@gmail.com>
 <f0a94b2157c7bde8ec8a275d2f8f648f2e6b7c47.1368379475.git.chauplac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <f0a94b2157c7bde8ec8a275d2f8f648f2e6b7c47.1368379475.git.chauplac@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Clement Chauplannaz <chauplac@gmail.com>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, andi@firstfloor.org

Clément, All,

On 2013-05-12 21:08 +0200, Clement Chauplannaz spake thusly:
> When --*-after options are used, two parameters are parsed from the
> command-line before the adequate function is called:
>   - the `before' option, after which the new option will be inserted,
>   - the name of the option to enable/disable/modularise.
> 
> With the short version of --*-after options (namely -E, -D, -M), the
> parsing step is not performed which leads to processing unset variables.
> 
> Add options -E, -D, -M to the test that triggers assignment of parameters
> for --*-after options.
> 
> Signed-off-by: Clement Chauplannaz <chauplac@gmail.com>

I've applied this to my tree in the branch yem-kconfig-rc-fixes, for
which I've just sent a pull-request to Michal. Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
