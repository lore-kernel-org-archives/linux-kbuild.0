Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:46324 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932619Ab2GXVNH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Jul 2012 17:13:07 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] scripts/config: fix double-quotes un-escaping
Date: Tue, 24 Jul 2012 23:13:04 +0200
References: <1342384655-7769-1-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1342384655-7769-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201207242313.04493.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

Michal, All,

On Sunday 15 July 2012 22:37:35 Yann E. MORIN wrote:
> When reporting a string value, only the first double-quote was un-escaped.
> We need to un-escape all escaped double-quotes.

Ping? ;-)
Do you plan to add this one to your tree before you ask Linus to pull?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
