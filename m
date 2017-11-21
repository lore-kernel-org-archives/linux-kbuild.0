Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:37196 "EHLO
        mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750794AbdKUTsv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Nov 2017 14:48:51 -0500
MIME-Version: 1.0
In-Reply-To: <1511251834.4822.113.camel@oracle.com>
References: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
 <716fa938a4ab0ad66490b72e2ed750cd6583728f.1510840787.git-series.knut.omang@oracle.com>
 <CAK7LNASBKPMG5eZ2yXPL_xOYUjr+0J56YMC5VRsE6o=xqz=DzA@mail.gmail.com>
 <CA+r1ZhgPUJ_WtCM=RgiPSrSvGrp7FMni2db6S9am5-LN_vhRdg@mail.gmail.com>
 <20171120200827.726yhebihjhrhted@ltop.local> <1511212212.4822.66.camel@oracle.com>
 <20171120212251.k4uvdstfhg6qtrag@ltop.local> <CA+r1Zhj295pmVTmh_TVMuy37qRQ7Q6Mxipk7vhyAVkuXFBU8uw@mail.gmail.com>
 <1511251834.4822.113.camel@oracle.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Tue, 21 Nov 2017 12:48:49 -0700
Message-ID: <CA+r1ZhhoadjbLyr2mf9Z-9BPE9K4wjpfmDEv2iOO6Oh0CxV2Xg@mail.gmail.com>
Subject: Re: [PATCH 2/7] kbuild: Add P= command line flag to run checkpatch
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Knut Omang <knut.omang@oracle.com>
Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>

On Tue, Nov 21, 2017 at 1:10 AM, Knut Omang <knut.omang@oracle.com> wrote:

> Would you like to keep the checkpatch changes in some form, or would you rather
> see everything happening in the wrapper?

I don't have a strong preference one way or another, but keeping
everything in a wrapper script might be easier if only because you
wouldn't need to get signoffs from whoever maintains checkpatch too.

-- 
Jim
