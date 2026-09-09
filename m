Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A540475354
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Sep 2026 22:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788993821; cv=none; b=mNJGy9vQsVpXbBkf8D7T+qzZLuyFtjGrXS1CIUZb4XefNNNTHYAKCof/8z+MKs8hYwd7iTTj56T/KpO0xzRCju9DjziZ93SbrNwFTJ84NjD1k4YGQKiWQ9nvx+OKLG+G7aFf7/ssvcyWwSHPUVp595H8/vSAy1XFmOeMJOW3l3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788993821; c=relaxed/simple;
	bh=qPuG5p0RFzxZ5A/zFAdZehA6Nlq32FKjBYxY1oi1wb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnV4YApQSrxdu/jlrjwKrcGs7KcNGYRY9bPcUOinQnWQ/7jI8dWO/BkKvCz7DBK0YmYKdAhBSmJAGpfmYIkGhsyC4LLFIQ1ieu7cWZXvTMl2bZApEm5NgevDwn2DsRCVY4//qKUE/f5UBrm0rXO998iEcL+se0DPLnark7hgpu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLUModup; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLUModup"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso668538f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 15:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788993809; x=1789598609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=02KomAtCOkWbCrlEbmnlwwKlgNzCkBBNmKfqlS9ULZs=;
        b=eLUModupHQlUOC88E8IknMW/6Ov5cgnOoqxE0iP7NohSPsBO85AUxOVmUNRf6zvEZU
         6ZFWkx/R1kSK2zld5Dpdp55MNx2ZdgrEBbScYYQ7O5C51LxPYwbeA6fvXPWR8Z6k8MZI
         PxLnHI3k4fHNHg5xlBudEovb08OygKjWwtXUHe542MmtBm/Q82usNErM6yPBlGQAmFi9
         /sUicuF3gqaKV2t0BkiP4j+eUQ47W8TMuDyIiPKFDf4rjEC6YunFrlgkmE5qYsysIrWw
         LFS2FuOqLHrTIRzdA0mCFOp5hqr0v+BExqwxCc7I/BjO6RoQlXJQR+bF4mDcJrT+Fp2C
         RQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788993809; x=1789598609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=02KomAtCOkWbCrlEbmnlwwKlgNzCkBBNmKfqlS9ULZs=;
        b=A2KKyba27I/YNRM1IYGE/UN7DA1y7KEkwC0CJnXQebNK+/JOWT4QJLVeZI/XoV2EGw
         tPcT/PNcBVUHj6nAg5qvT6X1aXz9adEXIHbKZjcan1l9hwGEl1SZ0AXPOodp9I5LVXZE
         IrQ9MHHD9H69riBNvGf2I87XdfYz37NHPvX1zgKaiXMVI5pLWylosWo/8/CY3qEhk1pi
         0SJ027tE0DDgpqZLmQgiBeTAhfFIzaAB4YriJtclCgHuWQ+tpSCxCvfnxzpPzNsH/DPe
         SF7flkgF9BbyZYcWBnq7KzMbHgIOqJsMgVd4PRhmAc+rqOfEGRwnY1gavzYG2ROEmqDZ
         uO4g==
X-Gm-Message-State: AFuF++kPlHxA/Oo/Xr0If7jXIHdo4P7wZJnVYA5WVrQUBZrvaFpL5tVW
	60eg2Jw0hzJdV9q6sY/IrIuDtvuxcXtuf0Qx7vshhDf3XgGRHBpibEFW
X-Gm-Gg: AYBFou3tfkj5N64/7QwE3EyO9Vt5RfwD3zP9XYVS8GZukcDZdpZZZb0q/BT1wtMBM/0
	vQnlS+H4LBo5b+NLpRRTT0mVg1wDYxGAD7rvQECcvGH+w/Q5n/ilx/NOwogjisgf3P+mQSdymq/
	3sCoNHNxqd8nbfYM3fwymTjpCYsy5HyNhUk/F4sIr50NlZiTSYujz3407zOIKu93TMrG9TSXEWQ
	inpLkkhoqR8uvGrwLdcjd/5WbYHNglRHrKprE+YNsY954aiq0BmdDJg2VxvFQCRsLjm+FJw5Nlp
	X7mMhLdvMJ6aU2mLGPPunS1oQIs0y+fI25UEMTxqS4pZjKT5He2EPxkAeh6ALZjdYLWgOF/r07g
	4olxKzI8UTBPBJheo3tRxks6VUjNkDXYIOw6p8GeDOE2x/PF1+7/4nbVXS8z7JUgV4vl3y47f62
	aNaPT5idVmrf5+HhMD+1Lp5YG8wnbt/p3jmMaFXX4OdIJpOcRjnABPo5L4kNYJ2MO1tcSsKwv2o
	URlfia293tyGzR9YhVTaQKw2EPLDEW3YrjLBPM/FQJ5nuIGuJzli+kl5aUcEd6H/6g=
X-Received: by 2002:a05:6000:2313:b0:484:3310:c4fc with SMTP id ffacd0b85a97d-485c23ef4e3mr7849785f8f.23.1788993808575;
        Wed, 09 Sep 2026 15:43:28 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm46358486f8f.14.2026.09.09.15.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 15:43:28 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <d3addcc8-070d-40e9-abea-ca23956d5cc8@gmail.com>
Date: Wed, 9 Sep 2026 23:43:27 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: preserve the final answer when input has no
 newline
To: Erkan Erdem <hexvalid@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev
References: <20260907103739.23212-2-hexvalid@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260907103739.23212-2-hexvalid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Erkan,

On 9/7/26 11:37, Erkan Erdem wrote:
> conf_string() unconditionally removes the last character returned by
> fgets(), assuming that it is a newline. When redirected input ends
> without a newline, the last character is part of the answer instead.
> For example, feeding 42 to an integer prompt stores 4, and feeding
> 0xff to a hexadecimal prompt stores 0xf. Both commands succeed despite
> silently changing the supplied value.
> 
> Strip the newline with strcspn() so that a complete answer at EOF is
> preserved. Keep the existing handling of newline-terminated and empty
> answers unchanged.
> 
> Add regression tests for string, int and hex answers, with and without
> a final newline, in oldaskconfig and oldconfig.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> ---
> 
> Changes in v2, addressing Julian Braha's review:
> - Add an in-tree regression test under scripts/kconfig/tests for string,
>   int and hex answers, with and without a final newline, in oldconfig
>   and oldaskconfig. The shared test harness is unchanged.
> - Submit this fix independently of the checkkconfigsymbols.py change.
> - Refresh Cc from scripts/get_maintainer.pl, including the LLVM contacts.
> 
> v1: https://lore.kernel.org/all/20260905123237.40670-1-hexvalid@gmail.com/
> 
> An AI coding assistant found the issue, prepared the fix and changelog,
> and ran the original verification. The assistant also prepared the new
> regression test and this v2 revision.
> 
> Validation:
> - Built original and fixed conf with Clang on macOS and GCC in an
>   x86_64 Linux container, using -Wall -Wmissing-prototypes
>   -Wstrict-prototypes -Werror.
> - On both platforms, the original conf fails all six unterminated-input
>   cases and passes all six newline-terminated controls.
> - The fixed conf passes the complete 33-test Kconfig suite on both
>   platforms, including all 12 new cases.
> - This tests the host configuration tool; a complete kernel was not built.
> 
>  scripts/kconfig/conf.c                        |  2 +-
>  .../kconfig/tests/conf_no_newline/__init__.py | 32 +++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/kconfig/tests/conf_no_newline/__init__.py
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index fe8ba09b0..46c9ca646 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -343,7 +343,7 @@ static int conf_string(struct menu *menu)
>  			}
>  			/* fall through */
>  		default:
> -			line[strlen(line)-1] = 0;
> +			line[strcspn(line, "\n")] = 0;
>  			def = line;
>  		}
>  		if (def && sym_set_string_value(sym, def))
> diff --git a/scripts/kconfig/tests/conf_no_newline/__init__.py b/scripts/kconfig/tests/conf_no_newline/__init__.py
> new file mode 100644
> index 000000000..0fca696d2
> --- /dev/null
> +++ b/scripts/kconfig/tests/conf_no_newline/__init__.py
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: GPL-2.0
> +"""
> +Preserve complete string, int and hex answers at end of input.
> +"""
> +
> +import subprocess
> +
> +import pytest
> +
> +from conftest import CONF_PATH
> +
> +
> +@pytest.mark.parametrize('mode', ['--oldaskconfig', '--oldconfig'])
> +@pytest.mark.parametrize('newline', ['', '\n'], ids=['eof', 'newline'])
> +@pytest.mark.parametrize('symbol_type, value, expected', [
> +    ('string', 'abcdef', '"abcdef"'),
> +    ('int', '42', '42'),
> +    ('hex', '0xff', '0xff'),
> +])
> +def test(mode, newline, symbol_type, value, expected, tmp_path, monkeypatch):

Please follow the style of the existing Kconfig tests.

For example, the function signature should look like 'def test(conf):'

> +    (tmp_path / 'Kconfig').write_text(
> +        'config TEST\n\t{} "Test value"\n'.format(symbol_type))

And you should keep a minimal Kconfig file in the directory, instead of
having the test create a temporary file each time it runs.

> +    monkeypatch.setenv('srctree', str(tmp_path))
> +    monkeypatch.setenv('KCONFIG_DEFCONFIG_LIST', '')
> +
> +    result = subprocess.run([CONF_PATH, mode, 'Kconfig'],
> +                            input=value + newline, text=True,
> +                            stdout=subprocess.PIPE, stderr=subprocess.PIPE,
> +                            cwd=tmp_path, timeout=10)
> +
> +    assert result.returncode == 0, result.stderr
> +    assert 'CONFIG_TEST={}\n'.format(expected) in (tmp_path / '.config').read_text()
> 
> base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c

- Julian Braha
