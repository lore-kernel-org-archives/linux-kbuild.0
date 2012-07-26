Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:19400 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752341Ab2GZQyp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Jul 2012 12:54:45 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] scripts/config: fix double-quotes un-escaping
Date: Thu, 26 Jul 2012 18:54:41 +0200
References: <1342384655-7769-1-git-send-email-yann.morin.1998@free.fr> <201207242313.04493.yann.morin.1998@free.fr> <20120726102035.GA25512@sepie.suse.cz>
In-Reply-To: <20120726102035.GA25512@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201207261854.41661.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Michal, All,

On Thursday 26 July 2012 12:20:35 Michal Marek wrote:
> On Tue, Jul 24, 2012 at 11:13:04PM +0200, Yann E. MORIN wrote:
> > On Sunday 15 July 2012 22:37:35 Yann E. MORIN wrote:
> > > When reporting a string value, only the first double-quote was un-escaped.
> > > We need to un-escape all escaped double-quotes.
> > 
> > Ping? ;-)
> > Do you plan to add this one to your tree before you ask Linus to pull?
> 
> Yes, I just did so.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
