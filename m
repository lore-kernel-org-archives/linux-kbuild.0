Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:40398 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751631AbdIMA6Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 20:58:24 -0400
Date: Tue, 12 Sep 2017 17:58:21 -0700
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 00/11] Kselftest make O=dir work
Message-ID: <20170913005821.GB22110@kroah.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, shuah@kernel.org, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, corbet@lwn.net, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

On Tue, Sep 12, 2017 at 05:52:53PM -0600, Shuah Khan wrote:
> During [MAINTAINERS SUMMIT] & [TECH TOPIC] Improve regression tracking
> discussion, it was brought to my attention that kselftest lacks support
> for make O=dir use-case which is used by several developers to relocate
> objects and keep the source tree clean.
> 
> I mentioned in thread that I would take a look at what it takes to support
> it and here is the patch series that does that.
> 
> This 11 patch series consists of fixes to get "make O=dir kselftest"
> use-case working,  extending the existing KBUILD_OUTPUT support.
> Majority of the changes are made to kselftest common infrastructure.
> Some test make files are changed as needed to address the custom build
> and run_tests.
> 
> -- futex has sub-directories which require custom build and run_tests.
> -- sync test needed a few changes to make use of lib.mk as much as possible
>    and still be able to run its custom build sequence.
> 
> With this series the following ways to build and run kselftest is possible:
> 
> -- Build all and Relocate objects to /tmp/kselftest and run tests:
>    make O=/tmp/kselftest kselftest
>    or
>    make KBUILD_OUTPUT=/tmp/kselftest kselftest
> 
> -- Build TARGETS and Relocate objects to /tmp/kselftest and run tests:
>    make O=/tmp/kselftest TARGETS="futex sync size" kselftest
>    or
>    make KBUILD_OUTPUT=/tmp/kselftest TARGETS="futex sync size" kselftest
> 
> -- Clean tests:
>    make O=/tmp/kselftest kselftest-clean
>    or
>    make KBUILD_OUTPUT=/tmp/kselftest kselftest-clean
> 
> All existing use-cases documented in Documentation/dev-tools/kselftest.rst
> are still supported.

Yeah!  Nice work.

greg k-h
