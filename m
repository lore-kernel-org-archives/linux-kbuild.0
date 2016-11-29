Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45548 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755060AbcK2AG4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Nov 2016 19:06:56 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uAT04IYg045190
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Nov 2016 19:06:55 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
        by mx0a-001b2d01.pphosted.com with ESMTP id 270vsg5ycj-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Nov 2016 19:06:55 -0500
Received: from localhost
        by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Tue, 29 Nov 2016 10:06:53 +1000
Subject: Re: [PATCH 2/2] builddeb: allow building without headers/firmware
 packages
References: <20160826081716.9435-1-andrew.donnellan@au1.ibm.com>
 <20160826081716.9435-2-andrew.donnellan@au1.ibm.com>
 <3149e502-1a4c-0413-b874-d40ed5bf4a42@au1.ibm.com>
 <CAAqcGHm_SRcrWOr+yxTy2oxgxKFwqa6-=ZHvf0M7pNCxoE7q5g@mail.gmail.com>
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Tue, 29 Nov 2016 11:06:49 +1100
MIME-Version: 1.0
In-Reply-To: <CAAqcGHm_SRcrWOr+yxTy2oxgxKFwqa6-=ZHvf0M7pNCxoE7q5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-Id: <0d78b326-96de-06dc-1bba-e8c3a88a27ae@au1.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On 25/11/16 23:24, Riku Voipio wrote:
> I'm not a big fan of this patch. It adds some complexity as evident by
> extra indent
> level it adds. On practice developers would end up passing a long command line
> with all KDEB_NO* variables.

That's fair! I think the approach in your new patch is probably better, 
I'll review that.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

