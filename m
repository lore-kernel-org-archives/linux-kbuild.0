Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-co1nam03on0123.outbound.protection.outlook.com ([104.47.40.123]:50250
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751488AbdIMSPS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2017 14:15:18 -0400
From: "Bird, Timothy" <Tim.Bird@sony.com>
Subject: RE: [PATCH 10/11] selftests: futex: copy sub-dir test scripts for
 make O=dir run
Date: Wed, 13 Sep 2017 18:15:09 +0000
Message-ID: <ECADFF3FD767C149AD96A924E7EA6EAF3AD1BF35@USCULXMSG01.am.sony.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
 <de8bf636371f4318503fdf23fe51352941e739d7.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <de8bf636371f4318503fdf23fe51352941e739d7.1505257614.git.shuahkh@osg.samsung.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>, "mmarek@suse.com" <mmarek@suse.com>, "shuah@kernel.org" <shuah@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "bamvor.zhangjian@linaro.org" <bamvor.zhangjian@linaro.org>, "emilio.lopez@collabora.co.uk" <emilio.lopez@collabora.co.uk>, "corbet@lwn.net" <corbet@lwn.net>
Cc: "tytso@mit.edu" <tytso@mit.edu>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>



> -----Original Message-----
> From: Shuah on Tuesday, September 12, 2017 4:53 PM
>=20
> For make O=3Ddir run_tests to work, test scripts from sub-directories
> need to be copied over to the object directory. Running tests from the
> object directory is necessary to avoid making the source tree dirty.
>=20
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  tools/testing/selftests/futex/Makefile | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/testing/selftests/futex/Makefile
> b/tools/testing/selftests/futex/Makefile
> index 7c647f619d63..9358cb210fd5 100644
> --- a/tools/testing/selftests/futex/Makefile
> +++ b/tools/testing/selftests/futex/Makefile
> @@ -11,10 +11,13 @@ all:
>  		BUILD_TARGET=3D$(OUTPUT)/$$DIR;	\
>  		mkdir $$BUILD_TARGET  -p;	\
>  		make OUTPUT=3D$$BUILD_TARGET -C $$DIR $@;\
> +		if [ -e $$DIR/$(TEST_PROGS) ]; then
> +			rsync -a $$DIR/$(TEST_PROGS) $$BUILD_TARGET/;

Same issue with rsync here.  This could be a 'cp -a', if I'm not mistaken.

> +		fi
>  	done
>=20
>  override define RUN_TESTS
> -	$(OUTPUT)/run.sh
> +	cd $(OUTPUT); ./run.sh
>  endef
>=20
>  override define INSTALL_RULE
> --
> 2.11.0
>=20

