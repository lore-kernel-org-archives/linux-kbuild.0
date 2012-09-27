Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 7.mo5.mail-out.ovh.net ([178.32.124.100]:47492 "EHLO
	mo5.mail-out.ovh.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751923Ab2I0TJh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Sep 2012 15:09:37 -0400
Received: from mail404.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id CEF1BFFACEE
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Sep 2012 10:38:28 +0200 (CEST)
Date: Thu, 27 Sep 2012 10:29:55 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH RESEND] ARM: add dtbImage.<dt> and dtbuImage.<dt> rules
Message-ID: <20120927082955.GR17667@game.jcrosoft.org>
References: <504DFBBF.5010202@free-electrons.com>
 <1348733441-11626-1-git-send-email-richard.genoud@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348733441-11626-1-git-send-email-richard.genoud@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Genoud <richard.genoud@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Michal Marek <mmarek@suse.cz>, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org

On 10:10 Thu 27 Sep     , Richard Genoud wrote:
> [add Grant Likely and Rob Herring in To: since this is maybe more OF
> related than ARM related]
> 
> This rules are useful for appended device tree conforming to the
> CONFIG_ARM_APPENDED_DTB kernel option.
> 
> The rule dtbImage.<dt> is actually just a:
> cat zImage <dt>.dtb > dtbImage.<dt>
> 
> The dtbuImage.<dt> makes an uImage out of the dtbImage.<dt> file.
> 
> KernelVersion: v3.6-rc5
> 
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> Tested-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
as discuss with Grant no this is a temporary solution so no Makefile Target

so nack

Best Regards,
J.
