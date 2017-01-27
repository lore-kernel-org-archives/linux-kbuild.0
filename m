Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58360 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754002AbdA0HTz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Jan 2017 02:19:55 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0R5s1HP060944
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Jan 2017 00:54:01 -0500
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
        by mx0a-001b2d01.pphosted.com with ESMTP id 287vaa79wk-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Jan 2017 00:54:01 -0500
Received: from localhost
        by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Fri, 27 Jan 2017 15:53:54 +1000
Subject: Re: [PATCH 3/3] powerpc: enable support for GCC plugins
References: <20161206062800.21800-1-andrew.donnellan@au1.ibm.com>
 <CAGXu5jKrU5GR3KDb9M-vtSpY+aRm2B0vGpahVYLtFTWs=g7Big@mail.gmail.com>
 <f5ea8825-532c-93bd-d51d-6ec1e541fae6@au1.ibm.com>
 <584A8E9E.22035.590FC72@pageexec.freemail.hu>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Fri, 27 Jan 2017 16:52:54 +1100
MIME-Version: 1.0
In-Reply-To: <584A8E9E.22035.590FC72@pageexec.freemail.hu>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Message-Id: <25e3a510-1652-5be9-cc26-24d35f9ac95e@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: pageexec@freemail.hu, Kees Cook <keescook@chromium.org>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Emese Revfy <re.emese@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Brad Spengler <spender@grsecurity.net>, Michal Marek <mmarek@suse.com>

On 09/12/16 21:59, PaX Team wrote:
>>>> the specific problem addressed here can (and IMHO should) be solved in
>>>> another way: remove the inclusion of the offending headers in gcc-common.h
>>>> as neither tm.h nor c-common.h are needed by existing plugins. for background,
>>
>> We can't build without tm.h: http://pastebin.com/W0azfCr0
>
> you'll need to repeat the removal of dependent headers. based on a quick
> test here across gcc 4.5-6.2, if you remove rtl.h, tm_p.h, hard-reg-set.h
> and emit-rtl.h in addition to tm.h, the plugins should build fine.

OK, I finally have a chance to look at this series again.

basic-block.h includes tm.h, and I don't believe we can remove that. I'm 
not convinced there's a way around this.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

