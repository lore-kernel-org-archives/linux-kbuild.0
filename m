Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:28371 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757411Ab1COT7F (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Mar 2011 15:59:05 -0400
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: Re: [PATCH 0/2] kconfig: allow multiple inclusion of the same file (resent)
Date: Tue, 15 Mar 2011 20:58:57 +0100
References: <1298572603-1907-1-git-send-email-yann.morin.1998@anciens.enib.fr>
In-Reply-To: <1298572603-1907-1-git-send-email-yann.morin.1998@anciens.enib.fr>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <201103152058.57151.yann.morin.1998@anciens.enib.fr>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hello !

On Thursday 24 February 2011 19:36:41 Yann E. MORIN wrote:
> This patch series makes it possible to source a file multiple times,
> eg. from different files, and/or under different conditions. Care has
> been taken to avoid circular inclusion, of course.

Really, no comment on this? :-)

Even if it is not wanted upstream, any comment on the validity of the code?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
