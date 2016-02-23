Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:39464 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754954AbcBWS2q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Feb 2016 13:28:46 -0500
Subject: Re: [PATCH v4 1/2] selftests: create test-specific kconfig fragments
References: <1452238054-15482-1-git-send-email-bamvor.zhangjian@linaro.org>
 <1452238054-15482-2-git-send-email-bamvor.zhangjian@linaro.org>
From: Shuah Khan <shuahkh@osg.samsung.com>
Message-ID: <56CCA4DC.4050508@osg.samsung.com>
Date: Tue, 23 Feb 2016 11:28:44 -0700
MIME-Version: 1.0
In-Reply-To: <1452238054-15482-2-git-send-email-bamvor.zhangjian@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, linux-api@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, khilman@linaro.org, tyler.baker@linaro.org, broonie@kernel.org, mpe@ellerman.id.au, dvhart@infradead.org, mmarek@suse.com, Shuah Khan <shuahkh@osg.samsung.com>

On 01/08/2016 12:27 AM, Bamvor Jian Zhang wrote:
> Create the config file in each directory of testcase which need
> more kernel configuration than the default defconfig. User could
> use these configs with merge_config.sh script:
> 
> Enable config for specific testcase:
> (export ARCH=xxx #for cross compiling)
> ./scripts/kconfig/merge_config.sh .config \
> 		tools/testing/selftests/xxx/config
> 
> Enable configs for all testcases:
> (export ARCH=xxx #for cross compiling)
> ./scripts/kconfig/merge_config.sh .config \
> 		tools/testing/selftests/*/config
> 
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
> Reviewed-by: Shuah Khan <shuahkh@osg.samsung.com>

Applied to linux-kselftest next for 4.6-rc1

thanks,
-- Shuah


-- 
Shuah Khan
Sr. Linux Kernel Developer
Open Source Innovation Group
Samsung Research America (Silicon Valley)
shuahkh@osg.samsung.com | (970) 217-8978
