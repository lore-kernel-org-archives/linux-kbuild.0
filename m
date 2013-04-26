Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:35167 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757350Ab3DZTgc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Apr 2013 15:36:32 -0400
Received: by mail-wi0-f172.google.com with SMTP id hm14so992694wib.17
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Apr 2013 12:36:31 -0700 (PDT)
Date: Fri, 26 Apr 2013 21:36:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
Message-ID: <20130426193626.GA5100@free.fr>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1304261459030.17575@oneiric>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Robert, All,

On Fri, Apr 26, 2013 at 03:05:02PM -0400, Robert P. J. Day wrote:
>   probably a simple explanation for this, but my first time playing
> with "make localmodconfig" and it appears to be tossing all my
> ath9k-related module settings.

Probably due to cset 422c809. It caused a few other issues.
I'm working on it. In the meantime, can you just try to revert it, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
