Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40ADF10DF;
	Sat,  9 Dec 2023 23:06:12 -0800 (PST)
X-QQ-mid: bizesmtpipv601t1702191953twkf
Received: from localhost.localdomain ( [255.141.82.1])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 10 Dec 2023 15:05:51 +0800 (CST)
X-QQ-SSF: 01200000000000B0J000000A0000000
X-QQ-FEAT: PsQCk6chbj6h4FU2I72BeOc3gpNWlAN7ZYYwmfNI2bTPdpmO6QR0dRY7cSJ5H
	q57bZVSsSmCepYmP49Uz+fXk9R94bDJXxL7H9nH3DVBL8zHBPdTVHFZhtOJ55wkwRXpckLk
	askBWocVTeETXN1Ry1ID2yHgx+eyCm9rqfDGwDIfqutekJ7wBXcTTtfZsmMajrRzHY4R7Ac
	12XkPO5qz4A08IvDO3pnady/N56oY/hYwrr4MgaQa0bF8D1yMfRWHu78VFMpVcm3VhOjA8u
	+qxG5xkE95LnX6GSdyuJV3wu+qsM+ajjEOjPd9FD6SHld9Wt9O2qzOVOET10eu66YvZ+gln
	nWXlO7YBkdTw3mRACg=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18368869975197440686
From: Jialu Xu <xujialu@vimux.org>
To: masahiroy@kernel.org
Cc: justinstitt@google.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	xujialu@vimux.org
Subject: Re: [PATCH v4] gen_compile_commands.py: fix path resolve with symlinks in it
Date: Sun, 10 Dec 2023 15:05:32 +0800
Message-Id: <20231210070533.925534-1-xujialu@vimux.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAK7LNAQAAZXV3i1sM0ZTFDC3eOaDWBVzOV9FmiLUM5YoX=89Wg@mail.gmail.com>
References: <CAK7LNAQAAZXV3i1sM0ZTFDC3eOaDWBVzOV9FmiLUM5YoX=89Wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpipv:vimux.org:qybglogicsvrgz:qybglogicsvrgz5a-1

>Is there any reason why you didn't simply replace
>os.path.abspath() with os.path.realpath() ?

I have tried it before, but obviously, I made a mistake.

>This patch uses pathlib.Path() just in one place,
>leaving many call-sites of os.path.*() functions.
>
>If it is just a matter of your preference,
>you need to convert os.path.*() for consistency
>(as a follow-up patch).

Keep os.path.* as os.path.realpath() works.

>I see one more os.path.abspath()
>
>    return (args.log_level,
>            os.path.abspath(args.directory),
>            args.output,
>            args.ar,
>            args.paths if len(args.paths) > 0 else [args.directory])
>
>Does it cause a similar issue for the 'directory' field
>with symbolic link jungles?

Yes, also fixed.


--
Best Regards
Jialu Xu


