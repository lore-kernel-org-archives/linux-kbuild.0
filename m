Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:51657 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751701Ab2DINWL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Apr 2012 09:22:11 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] scripts/config: properly report and set string options
Date: Mon, 9 Apr 2012 15:22:08 +0200
References: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201204091522.08882.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Michal, All,

On Monday 09 April 2012 14:49:10 Yann E. MORIN wrote:
> Currently, scripts/config removes the leading double-quote from
> string options, but leaves the trailing double-quote.
> 
> Also, double-quotes in a string are escaped, but scripts/config
> does not unescape those when printing
> 
> Finally, scripts/config does not escape double-quotes when setting
> string options.

I believe this should also go in for 3.4.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
