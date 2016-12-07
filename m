Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 001b2d01.pphosted.com ([148.163.156.1]:42230 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752965AbcLGBFh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Dec 2016 20:05:37 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uB715M7x142714
        for <linux-kbuild@vger.kernel.org>; Tue, 6 Dec 2016 20:05:33 -0500
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2760s5929q-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Dec 2016 20:05:33 -0500
Received: from localhost
        by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Wed, 7 Dec 2016 11:05:31 +1000
Subject: Re: [kernel-hardening] Re: [PATCH 3/3] powerpc: enable support for
 GCC plugins
References: <20161206062800.21800-1-andrew.donnellan@au1.ibm.com>
 <20161206062800.21800-3-andrew.donnellan@au1.ibm.com>
 <CAGXu5jKQf4ReBkGC85+r_j1rVUFTZoeWk9A_mjhjnFHq1PAr8Q@mail.gmail.com>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Wed, 7 Dec 2016 12:05:26 +1100
MIME-Version: 1.0
In-Reply-To: <CAGXu5jKQf4ReBkGC85+r_j1rVUFTZoeWk9A_mjhjnFHq1PAr8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-Id: <bf236e17-4b0f-e0c4-ba4d-4aadc1662b82@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kernel-hardening@lists.openwall.com
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Emese Revfy <re.emese@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Michal Marek <mmarek@suse.com>

On 07/12/16 07:40, Kees Cook wrote:
>> Compile tested with all plugins enabled on gcc 4.6-6.2,
>> x86->ppc{32,64,64le} and 4.8-6.2 ppc64le->ppc{32,64,64le}. Thanks to
>> Chris Smart for help with this.
>
> I assume also tested on 5.2? :)

Tested on the latest subrevision of every release branch up till 6.2, so 
yes :)

>> I think it's best to take this through powerpc#next with an ACK from
>> Kees/Emese?
>
> That would be fine by me. Please consider the whole series:
>
> Acked-by: Kees Cook <keescook@chromium.org>

Thanks!

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

