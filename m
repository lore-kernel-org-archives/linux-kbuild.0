Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545954;
	b=BAP82V5sYN39u7h0JZtg4pZ7oOOSksS/tF3AUipOewWSTrQOJ5vyVycx8AJBuPlBl7UM
	 A/0MjT2jf6GIuRnjUrl2J22X20dxmi9b4DLsgHw1pmzjNFl9Mrjr82zEAZpB+kmDLRKuT
	 rgFnmaSqho1A+z1ljqK9zbVKLLTnPAWftCFXP5ZfMLe+LhkIeSVAToXLvCOgsdKFQBVZu
	 SBKhBGyzIHqleqlgR6K1XNUDGkPHj8afuli1A78tsZhyCo4HIcHkntzKwvncIxuaH8dfT
	 eDSy6CPah1O4YD5Dh6T0eXZ/05MTctbdi/r4BYM5ISXy0sYXffP8XEtnb7xhKpKQG5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545954;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=eLV5i1h2Maz4efFluSDDdrb0YwAHGxnFPrtIuNcYclo=;
	b=d2/LhYTx6kygyjXosc++ViGDh+VmMtZdCxZxsv81PjP21pUVZnm5UawcISJPQ7pjh4DY
	 D1k3Q1KkTBwk9LcmHn9tWiCdTyfxtnAleGQ6tV/9OhjQmMYzob8OkgfPGa9h+XNKGO82Y
	 Xw5ztE05FlVjGXx/1W/vXWBp35925Wzy5G0YtdV5x5/gIourFtzN63EyhtnZkt31cX8Ai
	 UgApO9YVmWQIKCppvGSCQFkCE3eYXm1ggiefPnW4vo+z+gHNtOsM3VX0lXThB/GLL/XgX
	 j2ZZHb9oMCXxA21p1QseFE0ANF2AWsJSmbOGfF6ASY9lgLDch5863FJFDyPz2x4hiPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c13D6oR5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC33606A321;
	Fri, 13 Nov 2026 04:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c13D6oR5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EC01F000C4;
	Fri, 13 Nov 2026 04:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794545954;
	bh=eLV5i1h2Maz4efFluSDDdrb0YwAHGxnFPrtIuNcYclo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=c13D6oR53e40MJmUKOI2pIBn1/Xd90top50niHSoil0c28bt+0omJxkF2y8kZ7ft3
	 9afOnV7t6vzTVVAfeDx5i0wnLbpRAGe1MBTJ1kMxcTMU3sVdD6yiY3OQHk/hSX5XQ3
	 k9LF9aTg+aMlikGYXtEZOvghZVT2Pv5NLtxgGl7BXwjBdEIPja4tZMbj4nSFRYuK47
	 siL7QQ2f/5OV7oPEN2unIUHL3oOvdOP68KVoB4QSlEhBPtk7tpatAhdXccvzZn1kr9
	 Jw3KS5J19zWoEKtZXIIwnK1LlrGgJClt33BgLJSBmS9bTfV2xwwL0txImo3mZNymcG
	 bgrW9swywRxiQ==
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7] scripts/config: honor $KBUILD_OUTPUT by default
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Voytik <voytikd@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nicolas Schier <n.schier@fritz.com>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org
In-Reply-To: <20261006161155.862736-1-voytikd@gmail.com>
References: <20261006161155.862736-1-voytikd@gmail.com>
Date: Thu, 12 Nov 2026 21:59:06 -0700
Message-Id: <179454594618.814257.8646757102444143940.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2506; i=nathan@kernel.org;
 h=from:subject:message-id; bh=LmLc1ua9MO22CuSKBsx1zzq0p2XhETJ7Ot64x8TjVRw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnfZkpVTGliLp+0wKrq5IndUo9Y5MXzXOp5g3f7vMw3X
 XNZKn9uRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjI9w5GhhduCW/nth21vVjo
 rRBTFtLi/CNTnDux5P9LQfmSL7W15owMeyXX3picsI3z0MxjRyw4nxkcs5YSOOkxkT3j6GI+80c
 7uAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Hi Dmitry,

On 2026-10-06 18:11 +0200, Dmitry Voytik wrote:
> If $KBUILD_OUTPUT is set, use it by default if --file is not passed.
> 
> Fix the issue when the script silently updates a stale .config in
> the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> to be updated.
> Handle properly if the config file is a relative path.
> 
> The problem can be worked around with --file, but this is easy to miss,
> and is inconsistent with how the Makefile and other tools work
> (e.g., scripts/diffconfig).

I was finally able to sit down and look at this a little bit more. I
think we can avoid the use of realpath altogether, which would avoid
most of what Sashiko is complaining about. I tested the following diff
with your examples and they appear to pass without any issues. Please
give it a shot. I think we can drop most of the reproduction and
examples in the commit message. If you want to include them for others,
please put it below the '---' where you have the changelog, as I don't
think it needs to end up in git history.

diff --git a/scripts/config b/scripts/config
index 32428ea909c2..497551538433 100755
--- a/scripts/config
+++ b/scripts/config
@@ -144,6 +144,22 @@ while [[ $# -gt 0 ]]; do
 	fi
 done
 
+# If no '--file' was specified, use KBUILD_OUTPUT as the base if it exists
+if [[ "$FN" = ".config" && -n "$KBUILD_OUTPUT" ]]; then
+	if [[ ! -d "$KBUILD_OUTPUT" ]]; then
+		echo "KBUILD_OUTPUT is set ('$KBUILD_OUTPUT') but does not exist or is not a directory." >&2
+		echo "Create it before running $myname or use '--file' to specify configuration file." >&2
+		exit 1
+	fi
+	FN="$KBUILD_OUTPUT/$FN"
+fi
+# Turn FN into an absolute path if it is relative so that '--refresh' works on
+# the correct file. This does not use realpath, as $FN may not exist yet.
+case "$FN" in
+	/*) ;;
+	*) FN="$PWD/$FN" ;;
+esac
+
 set -- "${CMDS[@]}"
 if [ "$1" = "" ] ; then
 	usage
@@ -200,10 +216,10 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--state|-s)
-		if grep -q "# ${CONFIG_}$ARG is not set" $FN ; then
+		if grep -q "# ${CONFIG_}$ARG is not set" "$FN" ; then
 			echo n
 		else
-			V="$(grep "^${CONFIG_}$ARG=" $FN)"
+			V="$(grep "^${CONFIG_}$ARG=" "$FN")"
 			if [ $? != 0 ] ; then
 				echo undef
 			else
@@ -229,7 +245,7 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--refresh)
-		yes "" | make oldconfig KCONFIG_CONFIG=$FN
+		yes "" | make oldconfig KCONFIG_CONFIG="$FN"
 		;;
 
 	*)

-- 
Cheers,
Nathan

