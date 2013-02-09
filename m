Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:65205 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753901Ab3BILXm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 9 Feb 2013 06:23:42 -0500
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH resend v3 1/3] kconfig: nconf:  rewrite help texts
Date: Sat, 9 Feb 2013 12:23:36 +0100
References: <20130201182237.GA11098@mobil.systemanalysen.net> <201302090130.07194.yann.morin.1998@free.fr> <20130209034609.GA8891@mobil.systemanalysen.net>
In-Reply-To: <20130209034609.GA8891@mobil.systemanalysen.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201302091223.36881.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roland Eggner <edvx1@systemanalysen.net>
Cc: linux-kbuild@vger.kernel.org, Dmitry Voytik <dvv.kernel@gmail.com>, Michal Marek <mmarek@suse.cz>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org

Rolland, All,

On Saturday 09 February 2013 Roland Eggner wrote:
> On 2013-02-09 Saturday at 01:30 +0100 Yann E. MORIN wrote:
[--SNIP--]
> > > +"Text Box (Help Window)\n"
> > > +"----------------------\n"
> > > +"Use movement keys <Down> <Up> <PageDown> <PageUp> <End> <Home> as listed in\n"
> > > +"table above.\n"
> > 
> > ... keys [elided] as listed ...
> 
> Ok, because you are dropping patch 3/3.

If that was related to patch 3/3, that should have been in that patch,
not this one.

[--SNIP--]
> > Any reason for the re-indent with one more space?
> 
> Intention is optimization for fast reading, as usual in professional text 
> processing:  seperate words by single space;  separate sentences, half-sentences 
> and listing symbols by two spaces.

OK, I kept it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

