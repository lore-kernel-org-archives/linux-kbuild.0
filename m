Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60830 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750914AbaACQZD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jan 2014 11:25:03 -0500
Message-ID: <52C6E45A.2040507@suse.cz>
Date: Fri, 03 Jan 2014 17:24:58 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] deb-pkg: Fix cross-building linux-headers package
References: <1386254255.3000.20.camel@deadeye.wl.decadent.org.uk>	<CABsPBHr2geiFPL9QtgBb4c6UnABxdpt=VpEEh_ue8a7_VQdLjA@mail.gmail.com>	<1386294039.3000.29.camel@deadeye.wl.decadent.org.uk>	<CABsPBHob2cYEVhBT8=jaJXE=oZ_c-b2iv-sLTQQthX_EZPwPpg@mail.gmail.com>	<1386295673.3000.35.camel@deadeye.wl.decadent.org.uk>	<CABsPBHq+hUCo4twA0ypVekBBj_pdXpaKFxKROGmA1hTnMdcGCg@mail.gmail.com>	<1386302655.3000.48.camel@deadeye.wl.decadent.org.uk> <CABsPBHpyRmkz+51Jiz9FqGZtqvbm-E9qvu5PA_kuMbnr=7Oenw@mail.gmail.com>
In-Reply-To: <CABsPBHpyRmkz+51Jiz9FqGZtqvbm-E9qvu5PA_kuMbnr=7Oenw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Niew, Sh." <shniew@gmail.com>, Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

On 2013-12-06 05:20, Niew, Sh. wrote:
>>>>>>> On Thu, Dec 5, 2013 at 10:37 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
>>>>>>>> builddeb generates a control file that says the linux-headers package
>>>>>>>> can only be built for the build system primary architecture.  This
>>>>>>>> breaks cross-building configurations.  We should use $debarch for this
>>>>>>>> instead.
>>>>>>>>
>>>>>>>> Since $debarch is not yet set when generating the control file, set
>>>>>>>> Architecture: any and use control file variables to fill in the
>>>>>>>> description.
>>>>>>>>
>>>>>>>> Fixes: cd8d60a20a45 ('kbuild: create linux-headers package in deb-pkg')
>>>>>>>> Reported-by: "Niew, Sh." <shniew@gmail.com>
>>>>>>>> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
[...]
> Thanks, the attach patch is applied.
> And i just make it on linux-3.2.y by hand, and is successfully cross-build.
> Haven't test in 3.12

Thanks, applied to kbuild.git#misc.

Michal
