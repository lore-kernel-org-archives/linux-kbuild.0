Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41704 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725748AbeKNGcT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Nov 2018 01:32:19 -0500
Received: by mail-pf1-f195.google.com with SMTP id e22-v6so6642294pfn.8
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Nov 2018 12:32:31 -0800 (PST)
Date: Wed, 14 Nov 2018 05:32:27 +0900
From: Stafford Horne <shorne@gmail.com>
Subject: Re: [kbuild-all] [kbuild:kbuild 2/4]
 arch/openrisc/include/asm/spr.h:20:27: error: impossible constraint in 'asm'
Message-ID: <20181113203227.GD2718@lianli.shorne-pla.net>
References: <201811120258.np3G1anC%fengguang.wu@intel.com>
 <CAAfxs76Qe7ORo7RFqSXc28bY15DR3zCy6rUAvg9T76xWS1TsWw@mail.gmail.com>
 <CAAfxs76m4uk0VDah1AsMQMxtKUimc7LFKcuEGMtQbEQ_1xw9gQ@mail.gmail.com>
 <d8261318-27a8-aa28-bcc6-bc324cb711aa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8261318-27a8-aa28-bcc6-bc324cb711aa@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rong Chen <rong.a.chen@intel.com>
Cc: kbuild test robot <lkp@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, kbuild-all@01.org, Changbin Du <changbin.du@gmail.com>

On Tue, Nov 13, 2018 at 08:09:00AM +0800, Rong Chen wrote:
> Hi Atafford,
> 
> I do apologise for troubling you, we have updated the make.cross,
> you could use "GCC_VERSION=6.0.0 make.cross ARCH=openrisc" to reproduce.

Thanks, that explains it.  I see that Du Changbin has addressed the actualy
issue as well.

-Stafford
