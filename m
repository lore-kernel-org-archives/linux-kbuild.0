Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:55991 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751504AbYB2UEp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Feb 2008 15:04:45 -0500
Date: Fri, 29 Feb 2008 21:04:08 +0100
From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/3] fix recursive dependencies
Message-ID: <20080229200408.GD21494@elte.hu>
References: <200802210258.45011.yinghai.lu@sun.com> <200802241832.37850.yinghai.lu@sun.com> <200802242136.28744.yinghai.lu@sun.com> <200802242243.49576.yinghai.lu@sun.com> <20080226194058.GA31438@uranus.ravnborg.org> <Pine.LNX.4.64.0802290443440.2723@scrub.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0802290443440.2723@scrub.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kiran@scalemp.com, shai@scalemp.com, Glauber Costa <gcosta@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Yinghai Lu <Yinghai.Lu@Sun.COM>


* Roman Zippel <zippel@linux-m68k.org> wrote:

> The proper dependency check uncovered a few dependency problems, the 
> subarchitecture used a mixture of selects and depends on SMP and PCI 
> dependency was messed up.

thanks Roman, applied.

	Ingo
