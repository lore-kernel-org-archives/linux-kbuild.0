Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from [195.159.176.226] ([195.159.176.226]:33907 "EHLO
        blaine.gmane.org" rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1751888AbdJESFN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2017 14:05:13 -0400
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
        (envelope-from <glkd-linux-kbuild@m.gmane.org>)
        id 1e0AW7-0008Gc-6m
        for linux-kbuild@vger.kernel.org; Thu, 05 Oct 2017 20:05:03 +0200
From: Ritesh Raj Sarraf <rrs@researchut.com>
Subject: Re: [PATCH v3] scripts/package/builddeb: split generating packaging
 and build
Date: Thu, 05 Oct 2017 23:30:04 +0545
Message-ID: <1507225504.8551.11.camel@researchut.com>
References: <20171002104339.4349-1-riku.voipio@linaro.org>
         <CAK7LNARNU0GYYOU3TkduhTsmgDV+=d84D7AqCcopBw+twyuP7g@mail.gmail.com>
         <CAAqcGHkjNLvjz4X00U0edHp9qBh7=WRJdZ-q6uCihCxb2j0hOA@mail.gmail.com>
Reply-To: rrs@researchut.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <CAAqcGHkjNLvjz4X00U0edHp9qBh7=WRJdZ-q6uCihCxb2j0hOA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

On Wed, 2017-10-04 at 13:38 +0300, Riku Voipio wrote:
> > I see the same problem for bindeb-pkg as in v2.
> 
> The parallel build overload? I'm totally puzzled then. Debian is
> still
> stuck with make 4.1, so I guess there is a change in behaviour on
> later makes.
> 
> > "make deb-pkg" gave me tons of warnings, then finally fails to
> > build:

I have seen similar fork bombs when using kernel-package to build the
kernel. And no, I couldn't much debug back then.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=807574

At that time, realizing that the upstream kernel has a bindeb-pkg
target, was a big relief.


-- 
Given the large number of mailing lists I follow, I request you to CC
me in replies for quicker response

