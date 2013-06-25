Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from p-mail2.rd.orange.com ([195.101.245.16]:58556 "EHLO
	p-mail2.rd.orange.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752080Ab3FYIIr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Jun 2013 04:08:47 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH 15/15] kconfig: fix randomising choice entries in presence of KCONFIG_ALLCONFIG
Date: Tue, 25 Jun 2013 10:01:12 +0200
References: <cover.1372097219.git.yann.morin.1998@free.fr> <8357b48549e17b3e4e402c7f977b65708922e60f.1372097219.git.yann.morin.1998@free.fr>
In-Reply-To: <8357b48549e17b3e4e402c7f977b65708922e60f.1372097219.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201306251001.12430.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Sam Ravnborg <sam@ravnborg.org>, Sedat Dilek <sedat.dilek@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Fengguang Wu <fengguang.wu@intel.com>

Michal, All,

On Monday 24 June 2013 20:11:59 Yann E. MORIN wrote:
> Currently, randconfig does randomise choice entries, unless KCONFIG_ALLCONFIG
> is specified.
[--SNIP--]
> This patch defers setting that a choice has a value until a symbol for
> that choice is indeed set, so that choices are properly randomised when
> KCONFIG_ALLCONFIG is set, but not if a symbol for that choice is set.

I've just been informed by Fengguang that this patch breaks yet another
use-case of his, but this time KCONFIG_ALLCONFIG is not involved.

I'll investigate this issue when I'm back home tonight (ie. ~16:00 UTC).
Sorry for the breakage (again...). :-(

We really need a known, shared test-suite for kconfig... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
