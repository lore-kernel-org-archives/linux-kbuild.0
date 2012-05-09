Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:41246 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751720Ab2EIV2A (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 May 2012 17:28:00 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] scripts/config: properly report and set string options
Date: Wed, 9 May 2012 23:27:55 +0200
References: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201205092327.55249.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

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

Ping? I have not seen this in your tree yet...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
