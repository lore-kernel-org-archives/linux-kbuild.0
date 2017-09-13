Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-by2nam01on0124.outbound.protection.outlook.com ([104.47.34.124]:23136
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751106AbdIMSOO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2017 14:14:14 -0400
From: "Bird, Timothy" <Tim.Bird@sony.com>
Subject: RE: [PATCH 09/11] selftests: lib.mk: copy test scripts and test
 files for make O=dir run
Date: Wed, 13 Sep 2017 18:14:02 +0000
Message-ID: <ECADFF3FD767C149AD96A924E7EA6EAF3AD1BF23@USCULXMSG01.am.sony.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
 <7778068aed3cd76e2bc7f589e2409fe5a9eed75f.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <7778068aed3cd76e2bc7f589e2409fe5a9eed75f.1505257614.git.shuahkh@osg.samsung.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>, "mmarek@suse.com" <mmarek@suse.com>, "shuah@kernel.org" <shuah@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "bamvor.zhangjian@linaro.org" <bamvor.zhangjian@linaro.org>, "emilio.lopez@collabora.co.uk" <emilio.lopez@collabora.co.uk>, "corbet@lwn.net" <corbet@lwn.net>
Cc: "tytso@mit.edu" <tytso@mit.edu>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>



> -----Original Message-----
> From: Shuah Khan on Tuesday, September 12, 2017 4:53 PM
>
> For make O=3Ddir run_tests to work, test scripts, test files, and other
> dependencies need to be copied over to the object directory. Running
> tests from the object directory is necessary to avoid making the source
> tree dirty.
>=20
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  tools/testing/selftests/lib.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib=
.mk
> index 2e13cabb8007..9aa820d35c0c 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -37,7 +37,18 @@ define RUN_TESTS
>  endef
>=20
>  run_tests: all
> +ifneq ($(KBUILD_SRC),)
> +	@if [ "X$(TEST_PROGS) $(TEST_PROGS_EXTENDED) $(TEST_FILES)" !=3D
> "X" ]; then
> +		@rsync -aq $(TEST_PROGS) $(TEST_PROGS_EXTENDED)
> $(TEST_FILES) $(OUTPUT)

rsync seems a bit heavy-handed for this.  Is there a reason to use
rsync vs. just a regular cp?   Does the existing kbuild system already
have a dependency on rsync?  If not, I don't think we should introduce one
here.

BTW - great work!

> +	fi
> +	@if [ "X$(TEST_PROGS)" !=3D "X" ]; then
> +		$(call RUN_TESTS, $(TEST_GEN_PROGS)
> $(TEST_CUSTOM_PROGS) $(OUTPUT)/$(TEST_PROGS))
> +	else
> +		$(call RUN_TESTS, $(TEST_GEN_PROGS)
> $(TEST_CUSTOM_PROGS))
> +	fi
> +else
>  	$(call RUN_TESTS, $(TEST_GEN_PROGS) $(TEST_CUSTOM_PROGS)
> $(TEST_PROGS))
> +endif
>=20
>  define INSTALL_RULE
>  	@if [ "X$(TEST_PROGS)$(TEST_PROGS_EXTENDED)$(TEST_FILES)" !=3D
> "X" ]; then					\
> --
> 2.11.0
>=20

