Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from scrub.xs4all.nl ([194.109.195.176]:50168 "EHLO scrub.xs4all.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753470AbYB2NZc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Feb 2008 08:25:32 -0500
Date: Fri, 29 Feb 2008 14:22:01 +0100 (CET)
From: Roman Zippel <zippel@linux-m68k.org>
Subject: Re: [PATCH 1/3] fix recursive dependencies
In-Reply-To: <86802c440802282105j2c0d0ce3o551c3afdcc5c2b17@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0802291417140.2723@scrub.home>
References: <200802210258.45011.yinghai.lu@sun.com>  <200802241832.37850.yinghai.lu@sun.com>
  <200802242136.28744.yinghai.lu@sun.com>  <200802242243.49576.yinghai.lu@sun.com>
  <20080226194058.GA31438@uranus.ravnborg.org>  <Pine.LNX.4.64.0802290443440.2723@scrub.home>
 <86802c440802282105j2c0d0ce3o551c3afdcc5c2b17@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yinghai Lu <yhlu.kernel@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kiran@scalemp.com, shai@scalemp.com, Glauber Costa <gcosta@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

On Thu, 28 Feb 2008, Yinghai Lu wrote:

> x86: PARAVIRT needed by PARAVIRT_GUEST or X86_VSMP
> x86: vSMP selection in config

Sorry, I hadn't seen there already was a followup.

> in x86.git#testing to use Roman's three patches.

Only the first patch needs merging, the other two can wait a little.

bye, Roman
