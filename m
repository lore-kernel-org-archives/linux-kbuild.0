Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793834781;
	b=hx+y28icqW/zUzLzoIdcb7MEs7uTXXWLbWmt8ePJxy+HmlROGnxNBOJCEIgEVDwSQWUX
	 PdH2L+kc5tlUiHnJPl4WSrftLs9g8rDeM1ORYsx08FNd5FXi1ZiygdmdZTURgENEqid4H
	 TEHYSb3/wGgS0E5Y93T0bgMwSuJg9DfVY86LUw7piKZUoZurBDsr+NR1lFLyBRa6sOB0l
	 mGKfAuf21E+Fsn5LO3Zh+CX3Z7xZdlktQicTwXIQ6NAqP82LeGwJiNpDa65e4N39neUXu
	 wK+/FbbJsh0sh1YtOh5vevtU8e+yEfosLxbdJIoJcqgVTNXpNQCSTaKtADKzVp7pGtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793834781;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XTWf5qeKJyBoSVDGQva5y/SaBd2kBtkdfUXr+C5Izps=;
	b=YSe+xtHhjPohiodPGOojdciB8wYlO9DH3EGsMadWNWzq4Rlym2cfaQASLlE/fQsaaSUa
	 Sc13Yp1sQDjMrcOwe0HqlrHJs7HwFuoybZ3p1uUjLyeP4QXX/Ma7gbfOfoNPf8rgbxeHK
	 NO2dJcfjmD2i/08VG/lWi9W00vMflhKpyu7naXgy8uW+JwMZXTgKPuLzR39pg1BbkCt3Q
	 F6yilq3ikX8Gr+0BSVjjxbfTMAfqvcQRhMz1wu2kSceaBmD3IwsxRHMyGSDzHkfbr1KAJ
	 gxtK78ubagOR/fGPahBBanNw1E79Lhvjia+tv2LpdtUjSp2Pvmpuh6rXTWr/9UT064g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Napz4QcB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AB6606A328;
	Wed,  4 Nov 2026 23:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Napz4QcB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459841F000C1;
	Wed,  4 Nov 2026 23:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793834780;
	bh=XTWf5qeKJyBoSVDGQva5y/SaBd2kBtkdfUXr+C5Izps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Napz4QcByPDy7IDJixXooqlpML9kGdOd6aEwKZ+yicj81EIwcKAAKOHfT1wxZn85l
	 9gDNpC4AYBtqMRFekWhCGQCCfg0ZCU9v3KDU9BNd/tLCTdB3O2jql/rxEk2M2/1TXn
	 Q0p/nP9YZCKLatto9JxDwzJA3ArenH7yaoatyvejiiL99bX9iHp5Y7xRaZXgJOAVQU
	 FMjJ+cEX6Sju1mCpQmjDhWH+0MuCK4tsxnq+6UuRtjB1rniWL+avgnKvGZN3RxL/rb
	 /Tg/j47Qbh6UHnO4+j6/lKtaI3sVDIWDfRBVtvJQ4XN7NrOsRlDthJ/Exyo1Mmz7Tr
	 9709alscnrHmw==
Date: Wed, 4 Nov 2026 16:26:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, hamdy.aea@protonmail.com
Subject: Re: [PATCH v3] scripts: check-function-names: propagate nm failures
Message-ID: <20261104232616.GB3581619@ax162>
References: <20261104120357.7007-1-info@daylightlinux.ch>
 <20261104120733.7633-1-info@daylightlinux.ch>
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
In-Reply-To: <20261104120733.7633-1-info@daylightlinux.ch>

Hi Hamdy,

On Wed, Nov 04, 2026 at 01:07:33PM +0100, Hamdy Abou El Anein wrote:
> From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
> 
> The symbol-name check pipes nm through awk and grep. If nm cannot read
> an object file, its failure status is lost and the script reports
> success without checking any symbols.

If nm fails because vmlinux.o is malformed, surely that means that $(LD)
is going to choke on it too? This feels like unnecessary complication
and hardening for little gain. Were you able to reproduce a situation
where $(NM) failed but the rest of the build succeeded?

> Keep nm output streaming while carrying its exit status through the
> filter. This avoids buffering the full vmlinux.o symbol table in a
> shell variable during the serial kernel link, as the v2 did.

Just a work of advice for the future, avoid mentioning revisions within
the commit message, they won't make sense once the patch is applied.
Place differential notes below the '---' after your signoff and make
sure the commit message makes sense on its own.

> Tested with a malformed object (failure), a valid object (success), an
> object defining startup (failure), and a synthetic large nm stream
> (success).
> 
> AI assistance: ChatGPT/Codex identified the issue and prepared the
> change, commit message and executable regression tests.
> 
> Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
> ---
>  scripts/check-function-names.sh | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/check-function-names.sh b/scripts/check-function-names.sh
> index 94883e690627..b25e630cc594 100755
> --- a/scripts/check-function-names.sh
> +++ b/scripts/check-function-names.sh
> @@ -13,9 +13,28 @@ if [ ! -f "$objfile" ]; then
>  	exit 1
>  fi
>  
> -bad_symbols=$(${NM:-nm} -p "$objfile" | awk '$2 ~ /^[TtWw]$/ {print $3}' |
> -	      grep -E '^(startup|exit|split|unlikely|hot|unknown)(\.|$)')
> -
> +# Keep nm output streaming while preserving its exit status.
> +bad_symbols=$(
> +	{
> +		${NM:-nm} -p "$objfile"
> +		nm_status=$?
> +		printf '\n#nm_status %s\n' "$nm_status"
> +	} |
> +	awk '
> +		$1 == "#nm_status" {
> +			if ($2 != 0)
> +				nm_failed = 1
> +			next
> +		}
> +		$2 ~ /^[TtWw]$/ && $3 ~ /^(startup|exit|split|unlikely|hot|unknown)(\.|$)/ {
> +			print $3
> +		}
> +		END {
> +			if (nm_failed)
> +				exit 1
> +		}
> +	'
> +) || exit 1
>  if [ -n "$bad_symbols" ]; then
>  	echo "$bad_symbols" | while read -r sym; do
>  		echo "$objfile: error: $sym() function name creates ambiguity with -ffunction-sections" >&2
> -- 
> 2.56.0
> 

-- 
Cheers,
Nathan
