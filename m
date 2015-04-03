Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:33276 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752429AbbDCUwm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Apr 2015 16:52:42 -0400
Received: by paboj16 with SMTP id oj16so45566283pab.0
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Apr 2015 13:52:42 -0700 (PDT)
Date: Fri, 3 Apr 2015 13:52:40 -0700
From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v3] kbuild: Create directory for target DTB
Message-ID: <20150403205240.GF23023@localhost>
References: <9fdc43b280f2ad2e8887b63b341686254107f87d.1427719132.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fdc43b280f2ad2e8887b63b341686254107f87d.1427719132.git.michal.simek@xilinx.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Simek <michal.simek@xilinx.com>
Cc: arm@kernel.org, Zach Pfeffer <zachp@xilinx.com>, Nathan Rossi <nrossi@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, catalin.marinas@arm.com, will.deacon@arm.com, Nathan Rossi <nathan.rossi@xilinx.com>, linux-kernel@vger.kernel.org, monstr@monstr.eu, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Mon, Mar 30, 2015 at 02:39:08PM +0200, Michal Simek wrote:
> From: Nathan Rossi <nathan.rossi@xilinx.com>
> 
> When building specific DTBs out of the kernel tree the vendor subdirs
> (boot/dts/<vendor>) are not created, ensure that they are before
> building the DTB.
> 
> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Acked-by: Will Deacon <will.deacon@arm.com>
> ---

Thanks, applied.


-Olof
