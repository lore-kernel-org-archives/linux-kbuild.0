Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f194.google.com ([74.125.82.194]:57502 "EHLO
	mail-we0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753745Ab2LQSXF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 Dec 2012 13:23:05 -0500
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] menuconfig:inputbox: support navigate input position
Date: Mon, 17 Dec 2012 19:22:59 +0100
References: <20121217143802.GB16993@udknight>
In-Reply-To: <20121217143802.GB16993@udknight>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201212171922.59669.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wang YanQing <udknight@gmail.com>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, rdunlap@xenotime.net, bp@alien8.de, sakiwit@gmail.com, lacombar@gmail.com, lucas.demarchi@profusion.mobi, dave@gnu.org, paul.gortmaker@windriver.com, crquan@gmail.com, bpoirier@suse.de

Wang, All,

On Monday 17 December 2012 Wang YanQing wrote:
> This patch add support navigate input position *inside* the input
> field with LEFT/RIGHT, so it is possible to modify the text in place.
> 
> Signed-off-by: Wang YanQing <udknight@gmail.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I am not knowledgeable enough in ncurses and the dialog code-base
to add any reviewed-by tag. All I can say, is that it works as
advertised.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

