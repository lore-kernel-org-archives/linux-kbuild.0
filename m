Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53376 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752445AbcKOWpl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Nov 2016 17:45:41 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uAFMcp7e071937
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Nov 2016 17:45:40 -0500
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
        by mx0a-001b2d01.pphosted.com with ESMTP id 26r2x1xy9u-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Nov 2016 17:45:39 -0500
Received: from localhost
        by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Wed, 16 Nov 2016 08:45:37 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
        by d23dlp02.au.ibm.com (Postfix) with ESMTP id 3466A2BB0045
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Nov 2016 09:45:35 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
        by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id uAFMjYvk46268524
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Nov 2016 09:45:34 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
        by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id uAFMjXDT032602
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Nov 2016 09:45:34 +1100
Subject: Re: [kernel-hardening] [PATCH] powerpc/kernel: Disable the latent
 entropy plugin unconditionally
References: <20160626173451.c8406cd0c7a87cc3f94d9753@gmail.com>
 <70eb7a4c-be31-3fdd-a5b4-8075b29b3b38@au1.ibm.com>
 <CAGXu5j+8=3Vxm52Y2QbkDiCPx5X6DWemPO7B=2kj2EdVQpLHpA@mail.gmail.com>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Wed, 16 Nov 2016 09:45:31 +1100
MIME-Version: 1.0
In-Reply-To: <CAGXu5j+8=3Vxm52Y2QbkDiCPx5X6DWemPO7B=2kj2EdVQpLHpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-Id: <f1e8522c-b33a-77ce-c2c3-9c74a468e663@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>

On 16/11/16 09:41, Kees Cook wrote:
> Just checking in: did these patches materialize? I'd love to see
> plugins working on v4.10 for ppc.

Working on it! 
https://github.com/ajdlinux/linux/tree/powerpc-gcc-plugin-infrastructure

Just need to test with all the compilers to figure out which ones are 
broken so we can put a version check in...

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

