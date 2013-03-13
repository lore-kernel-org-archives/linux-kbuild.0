Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:48694 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932346Ab3CMS1t (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Mar 2013 14:27:49 -0400
Received: by mail-we0-f176.google.com with SMTP id s43so1283043wey.7
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2013 11:27:48 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] kconfig: do randomise choice entries in presence of KCONFIG_ALLCONFIG
Date: Wed, 13 Mar 2013 19:27:44 +0100
References: <20130227214102.6d63544d@skate> <1362931313-31829-1-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1362931313-31829-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201303131927.45170.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Arnaud Lacombe <lacombar@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Hello All!

On Sunday 10 March 2013 Yann E. MORIN wrote:
> Currently, randconfig does randomise choice entries, unless KCONFIG_ALLCONFIG
> is specified.
[--SNIP--]
> This patch defers setting that a choice has a value until a symbol for
> that choice is indeed set, so that choices are properly randomised when
> KCONFIG_ALLCONFIG is set, but not if a symbol for that choice is set.

Ping? Any more comments on that patch? :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
