Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:38986 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751344AbbHRKpM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Aug 2015 06:45:12 -0400
Date: Tue, 18 Aug 2015 11:44:58 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2] ARM: add boot image dependencies to not generate
 invalid images
Message-ID: <20150818104458.GO7557@n2100.arm.linux.org.uk>
References: <1439049211-4181-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439049211-4181-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Aug 09, 2015 at 12:53:31AM +0900, Masahiro Yamada wrote:
> U-Boot is often used to boot the kernel on ARM boards, but uImage
> is not built by "make all", so we are often inclined to do
> "make all uImage" to generate DTBs, modules and uImage in a single
> command, but we should notice a pitfall behind it.  In fact,
> "make all uImage" could generate an invalid uImage if it is run with
> the parallel option (-j).

Please put this patch in the patch system.  Thanks.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
