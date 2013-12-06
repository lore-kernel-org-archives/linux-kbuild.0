Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qe0-f43.google.com ([209.85.128.43]:54234 "EHLO
	mail-qe0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752159Ab3LFBpl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Dec 2013 20:45:41 -0500
Received: by mail-qe0-f43.google.com with SMTP id 2so48207qeb.16
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Dec 2013 17:45:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1386294039.3000.29.camel@deadeye.wl.decadent.org.uk>
References: <1386254255.3000.20.camel@deadeye.wl.decadent.org.uk>
	<CABsPBHr2geiFPL9QtgBb4c6UnABxdpt=VpEEh_ue8a7_VQdLjA@mail.gmail.com>
	<1386294039.3000.29.camel@deadeye.wl.decadent.org.uk>
Date: Fri, 6 Dec 2013 09:45:41 +0800
Message-ID: <CABsPBHob2cYEVhBT8=jaJXE=oZ_c-b2iv-sLTQQthX_EZPwPpg@mail.gmail.com>
Subject: Re: [PATCH 1/2] deb-pkg: Fix cross-building linux-headers package
From: "Niew, Sh." <shniew@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

On Fri, Dec 6, 2013 at 9:40 AM, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Fri, 2013-12-06 at 09:35 +0800, Niew, Sh. wrote:
>> On Thu, Dec 5, 2013 at 10:37 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
>> > builddeb generates a control file that says the linux-headers package
>> > can only be built for the build system primary architecture.  This
>> > breaks cross-building configurations.  We should use $debarch for this
>> > instead.
>> >
>> > Since $debarch is not yet set when generating the control file, set
>> > Architecture: any and use control file variables to fill in the
>> > description.
>> >
>> > Fixes: cd8d60a20a45 ('kbuild: create linux-headers package in deb-pkg')
>> > Reported-by: "Niew, Sh." <shniew@gmail.com>
>> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> [...]
>> I can't patch this to my linux-3.2.y tree which i clone from linux-stable
>> I check that the patches number line are different...
>> What i missed?
>
> This is for mainline; it should apply cleanly to 3.12.

What if i want to test this to 3.2?
