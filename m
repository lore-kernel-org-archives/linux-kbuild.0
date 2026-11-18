Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989429;
	b=ec2Nz//hiZZqOhrdqRFMUJAUp9ms+3+hpfKr3xVK/I/3uBlhYu4vrxAzKUsfCcdYHxGX
	 Z18Oe5X1CoVwWGjn5iy0YHd4p2dJLuN16+DrTriHtivHzig1hxErCRNhe9nV2F+e2UWbh
	 oXXnxeAi4R4uXmwvhw+2YjvzOv+BYnKRG90+ciK+mJyHnVdXpRjzBj0VeOrXzQtyjGoYd
	 yCjhidl3mF3t9HFb0SfZelGmfSzEPDm7OOvXRTymkP52ZOcynDQaRKddtLDVMf0mznNP3
	 or1NG34BEB+tuVpyFzNU/wVRlLLKy1XskoQIw++gX+qtkqrUvOIiJY2kUqWTLIuUK9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989429;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ysVuCBsvow/2lA5QJ0asfWcs7A4bu8Upjq+SGHRhdag=;
	b=F/UGPfPIuoCJdPGmkiot3H1DjFLyqAE8h6nV++rJr5bfvBWYe1QzaZCyVKgXde5zxGO+
	 icNM/83Y21lcfrygeFYl0bazn/UnEdIY68QhzS4OBQaGr7G6SJacKlDciLoOHCj2gho2Y
	 P/Mk2FTPpj75FhLE+SAJVflB4khod1EBrI88D4QES5asrYOlZu5UrbITsk9ayb1GTeBNV
	 e3E4HhWTUBxnYp9QLHjnO3ohn2XP3mY0j3l19LWneaqxgI4RQNf0uysK+6aEW202iqBA/
	 Gt/BpPWqP3OUO1qdqahshS6QXp+yt2Key1zAaUXZWqDKwstHYDvo0IXJ6VG9LShCFYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Y/iGFDv/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C073B606A31C;
	Wed, 18 Nov 2026 08:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y/iGFDv/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8891F000C4;
	Wed, 18 Nov 2026 08:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794989429;
	bh=ysVuCBsvow/2lA5QJ0asfWcs7A4bu8Upjq+SGHRhdag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y/iGFDv/Lu3mdfP6P6hUTu+cvuUKozDjE3jjK4AG1jDjVVboSC8X/Qg8jqnr9MWEL
	 +U+HP7f3yY8GbFyim+tZZxiN4qJzoHzBSilz0G55sMgeTWVXC9TamljjrzXpu0SKGV
	 LED3bqbOjD5Rg8J25OJSnKHMohF/vfY2fwPHQBiSwjFgbUPjVhxQt5h+UgsCcKAVdC
	 ps09gEOfyHLh/5NLFXtKqLomG1w+czlHjM7AxBADR6R3m3GCwOKa2R80JMTpdkRjle
	 Qme6QKamnFOnCnEPg1rsxiSLClm3eBuA5mjBOQvCI15jrjwm2Hw5LBu/OqM9Fe15ZI
	 dodomJdE1bWeQ==
Date: Wed, 18 Nov 2026 01:10:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Dmitry Voytik <voytikd@gmail.com>, Nicolas Schier <nsc@kernel.org>,
	Nicolas Schier <n.schier@fritz.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v8] scripts/config: honor $KBUILD_OUTPUT by default
Message-ID: <20261118081025.GA671584@ax162>
References: <20261117132513.52725-1-voytikd@gmail.com>
 <26f53b63-2f75-4fa4-bf6f-d3495e4e5cb0@gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26f53b63-2f75-4fa4-bf6f-d3495e4e5cb0@gmail.com>

On Tue, Nov 17, 2026 at 07:25:17PM +0000, Julian Braha wrote:
> On 11/17/26 13:25, Dmitry Voytik wrote:
> > +# If no '--file' was specified, use KBUILD_OUTPUT as the base if it exists
> > +if [[ "$FN" = ".config" && -n "$KBUILD_OUTPUT" ]]; then
> 
> Right so this will give different results with:
>     '--file .config'
> and:
>     '--file ./.config'
> 
> but maybe that was intentional -- i.e. we're assuming a user passing
> '.config' intends it to be '$KBUILD_OUTPUT/.config' while a user passing
> './.config' would intend CWD/.config?

It was intentional since I had figured they were passing the default
value so they should get the default behavior. Maybe it would be better
to only do this when no '--file' value was provided period though to
avoid some unexpected behavior?

diff --git a/scripts/config b/scripts/config
index 32428ea909c2..b09058ea1815 100755
--- a/scripts/config
+++ b/scripts/config
@@ -130,12 +130,14 @@ on_exit() {
 trap on_exit EXIT
 
 FN=.config
+USER_SET_FILE=0
 CMDS=()
 while [[ $# -gt 0 ]]; do
 	if [ "$1" = "--file" ]; then
 		if [ "$2" = "" ]; then
 			usage
 		fi
+		USER_SET_FILE=1
 		FN="$2"
 		shift 2
 	else
@@ -144,6 +146,22 @@ while [[ $# -gt 0 ]]; do
 	fi
 done
 
+# If no '--file' was specified, use KBUILD_OUTPUT as the base if it exists
+if [[ "$USER_SET_FILE" = "0" && -n "$KBUILD_OUTPUT" ]]; then
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
@@ -200,10 +218,10 @@ while [ "$1" != "" ] ; do
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
@@ -229,7 +247,7 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--refresh)
-		yes "" | make oldconfig KCONFIG_CONFIG=$FN
+		yes "" | make oldconfig KCONFIG_CONFIG="$FN"
 		;;
 
 	*)
-- 
Cheers,
Nathan
