Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43553 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753870AbdA0F4o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Jan 2017 00:56:44 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0R5sHYj061300
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Jan 2017 00:56:43 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
        by mx0a-001b2d01.pphosted.com with ESMTP id 287vaa7c2f-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Jan 2017 00:56:43 -0500
Received: from localhost
        by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Fri, 27 Jan 2017 15:56:39 +1000
Subject: Re: [PATCH 3/3] powerpc: enable support for GCC plugins
References: <20161206062800.21800-1-andrew.donnellan@au1.ibm.com>
 <CAGXu5jKrU5GR3KDb9M-vtSpY+aRm2B0vGpahVYLtFTWs=g7Big@mail.gmail.com>
 <f5ea8825-532c-93bd-d51d-6ec1e541fae6@au1.ibm.com>
 <584A8E9E.22035.590FC72@pageexec.freemail.hu>
 <25e3a510-1652-5be9-cc26-24d35f9ac95e@au1.ibm.com>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Fri, 27 Jan 2017 16:55:37 +1100
MIME-Version: 1.0
In-Reply-To: <25e3a510-1652-5be9-cc26-24d35f9ac95e@au1.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Message-Id: <abbe5484-b546-6987-de5f-c0070657efba@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: pageexec@freemail.hu, Kees Cook <keescook@chromium.org>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Emese Revfy <re.emese@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Brad Spengler <spender@grsecurity.net>, Michal Marek <mmarek@suse.com>

On 27/01/17 16:52, Andrew Donnellan wrote:
> basic-block.h includes tm.h, and I don't believe we can remove that. I'm
> not convinced there's a way around this.

Includes via function.h, I should say.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

