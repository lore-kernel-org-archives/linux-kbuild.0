Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42024 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751845AbdIWAgz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Sep 2017 20:36:55 -0400
Date: Fri, 22 Sep 2017 17:36:13 -0700
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 10/11] selftests: futex: copy sub-dir test scripts for
 make O=dir run
Message-ID: <20170923003613.GF20327@fury>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
 <de8bf636371f4318503fdf23fe51352941e739d7.1505257614.git.shuahkh@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de8bf636371f4318503fdf23fe51352941e739d7.1505257614.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, shuah@kernel.org, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, corbet@lwn.net, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

On Tue, Sep 12, 2017 at 05:53:03PM -0600, Shuah Khan wrote:
> For make O=dir run_tests to work, test scripts from sub-directories
> need to be copied over to the object directory. Running tests from the
> object directory is necessary to avoid making the source tree dirty.
> 
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  tools/testing/selftests/futex/Makefile | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/futex/Makefile b/tools/testing/selftests/futex/Makefile
> index 7c647f619d63..9358cb210fd5 100644
> --- a/tools/testing/selftests/futex/Makefile
> +++ b/tools/testing/selftests/futex/Makefile
> @@ -11,10 +11,13 @@ all:
>  		BUILD_TARGET=$(OUTPUT)/$$DIR;	\
>  		mkdir $$BUILD_TARGET  -p;	\
>  		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;\
> +		if [ -e $$DIR/$(TEST_PROGS) ]; then
> +			rsync -a $$DIR/$(TEST_PROGS) $$BUILD_TARGET/;

Hrm, I was going to raise a concern with adding an rsync dependency
here, but it is already used several times by lib.mk, so that isn't new.

Reviewed-by: Darren Hart (VMware) <dvhart@infradead.org>

-- 
Darren Hart
VMware Open Source Technology Center
