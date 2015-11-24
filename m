Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46463 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753961AbbKXQuP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Nov 2015 11:50:15 -0500
Subject: Re: [PATCH v3] package Makefile: fix perf-tar targets when outdir is
 set
References: <1441116861-28604-1-git-send-email-riku.voipio@linaro.org>
 <CAAqcGH=s3VL8y4QzycZR0ueMHmwJ4UcyUZMP4sjxSteb-X_itA@mail.gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <56549545.5060908@suse.cz>
Date: Tue, 24 Nov 2015 17:50:13 +0100
MIME-Version: 1.0
In-Reply-To: <CAAqcGH=s3VL8y4QzycZR0ueMHmwJ4UcyUZMP4sjxSteb-X_itA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 2015-11-16 11:09, Riku Voipio wrote:
> On 1 September 2015 at 17:14,  <riku.voipio@linaro.org> wrote:
>> From: Riku Voipio <riku.voipio@linaro.org>
>>
>> building with $srctree != $objtree, perf-tar-* targets fail
>> to read the MANIFEST file and add the PERF-VERSION-FILE needed
>> by out-of-tree builds. The build errors and an incorrect tar is created:
>>
>> $ make O=build-x86 perf-targz-src-pkg
>>   TAR
>> cat: ../tools/perf/MANIFEST: No such file or directory
>> tar: perf-4.1.0-rc8/PERF-VERSION-FILE: Cannot stat: No such file or
>> dir..
>> tar: Exiting with failure status due to previous errors
>>
>> Kbuild sets objtree to "." and srctree to ".." The command to output
>> MANIFEST becomes:
>>
>>    $(cd ..; echo $(cat ../tools/perf/MANIFEST))
>>
>> Without MANIFEST, the entire kernel source tree is added to the perf
>> source tarball. The *correct* fix is to keep the cd and remove srctree
>> from cat command line since MANIFEST has wildcards that fail to expand
>> working directory isn't srctree.
>>
>> Second, PERF-VERSION-FILE gets not added, because in-tree build path is
>> hardcoded to Makefile:
>>
>>    util/PERF-VERSION-GEN ../../$(perf-tar)/ 2>/dev/null)
>>
>> The PERF-VERSION-GEN needs to be run from tools/perf directory,
>> and the output directory needs to be changed from relative to
>> to absolute. This can be achieved using the $(CURDIR) variable.
>>
>> Also remove the error redirect to /dev/null which hid the error.
>>
>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> 
> Ping?

Added to kbuild.git#misc now, sorry for the delay.

Michal

