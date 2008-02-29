Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0910.google.com ([209.85.198.185]:17491 "EHLO
	rv-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751031AbYB2FFf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Feb 2008 00:05:35 -0500
Received: by rv-out-0910.google.com with SMTP id k20so2429244rvb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Feb 2008 21:05:34 -0800 (PST)
Message-ID: <86802c440802282105j2c0d0ce3o551c3afdcc5c2b17@mail.gmail.com>
Date: Thu, 28 Feb 2008 21:05:34 -0800
From: "Yinghai Lu" <yhlu.kernel@gmail.com>
Subject: Re: [PATCH 1/3] fix recursive dependencies
In-Reply-To: <Pine.LNX.4.64.0802290443440.2723@scrub.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200802210258.45011.yinghai.lu@sun.com>
	 <200802241832.37850.yinghai.lu@sun.com>
	 <200802242136.28744.yinghai.lu@sun.com>
	 <200802242243.49576.yinghai.lu@sun.com>
	 <20080226194058.GA31438@uranus.ravnborg.org>
	 <Pine.LNX.4.64.0802290443440.2723@scrub.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kiran@scalemp.com, shai@scalemp.com, Glauber Costa <gcosta@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Feb 28, 2008 at 8:09 PM, Roman Zippel <zippel@linux-m68k.org> wrote:
> Hi,
>
>  On Tue, 26 Feb 2008, Sam Ravnborg wrote:
>
>  > We discovered a situation where we could set a
>  > choice value in menuconfig but later when we either was
>  > running menuconfig or oldconfig the value were changed.
>
>  The patch fixes these dependency problems.
>
>  bye, Roman
>
>
>  The proper dependency check uncovered a few dependency problems,
>  the subarchitecture used a mixture of selects and depends on SMP
>  and PCI dependency was messed up.
>
>  Signed-off-by: Roman Zippel <zippel@linux-m68k.org>
>
>  ---
Ingo,

please drop
x86: PARAVIRT needed by PARAVIRT_GUEST or X86_VSMP
x86: vSMP selection in config
in x86.git#testing to use Roman's three patches.

Thanks

Yinghai Lu
