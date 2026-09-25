Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3542C486E62
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2026 22:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374765; cv=none; b=kklhaQugA9OaZNTLQyxK02bhFgw588W3qMqs0kDpvu07eRJZzQA5Zifq2ogBD7hI3kE0XtTwUTxm/LMvb/Iw8tj+jegOhkOlyWODi8b6VvgKVafJKVEQPpKLRe3ZfaruH2FH8Vp0x2PMTxUdFVgoPA9cD66JhpgzLyKSqbwbAJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374765; c=relaxed/simple;
	bh=152hnQ82QfJ0LW+Dm6mPNkhaiXoMmZUG70QpGAGRnCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvDdIsRiwHB4nMCC6DFo7psZGXtCPxASOOsAXc8xun3pFmWEWmNqv2LjpFSMIfi2WKbrJZWRNK8oMHNeYHhdv1kHNDO9eJDg/PedRaZ5PpRz6XLWlGoNLjHnkPYY07/loz6YjQ9Lt2224RkotSv6jWsIQqCj3xKMYdzIerErBKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xf4uHEk4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xf4uHEk4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so12420825e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2026 15:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790374761; x=1790979561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZ13srzmxe7uWv22g+0yXS08pgsXrImaRy4OqvYDzm0=;
        b=Xf4uHEk4NuRUeWii1BKdAA2xpt/Auoam8PYnvyllKTcG6OipsHyIZG2v60/IN+pLlo
         PorljFt2s1kvWCH/KaW/HSlgClT1rP/8QCuNBwZn52QGqYZ4Lmqd8zM3xT80x1Iypl+R
         iJkF/oMxE+4SGlF2twZn8Inm3p6HeJr3uL8y+bctYp3ZscOJMfUoT6Mzq+XoCT0RUim8
         9FSjAgKHdErgVqi/FjOs1zY1AdFxXwaLN06VJuy8f025CapQ9BwZuLH8HanK51yEldvB
         Ut2TWs/NOKdsEoQXcTxUw8q9vdUjRRfi1gcD/BPPiX9AZTRXrXe83IFfZdRidv8Y+Hn6
         jObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790374761; x=1790979561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wZ13srzmxe7uWv22g+0yXS08pgsXrImaRy4OqvYDzm0=;
        b=MzxUiv511d22VVw/SlQG41CTPFjFQcUnjuDyjLgQviemj551TNA8GrajPewhmG86iZ
         Itijar//spSXeFxVgfNfIps9rrfy2TkyPHVEVRbcObjx0IuP+9mNGcG2UJwCZWWEOXwn
         wn85R+2X4Lp6gkvxv26aZjUQt4w94lldKcMnoiLk/m66j9mq1NqSsdoowOWvTSORbnM2
         R01dz+Z+uvrLJbA64lAW7yMIj3mmxb8ac5aKZWCXJlZl1RDmhQV70vDfujzlxlo7DSCH
         s12+zbhS0vZUWfOA+co9FZkXarfkOIcVBqUxkqYkQXcKBxwkTkuNRuDrztxrtPwzqj4G
         OBYA==
X-Forwarded-Encrypted: i=1; AKwUvBxBtAjbZLOwJsawKENdH3RR0bdCDy32NCwnTLsX7JhEQS/wdRPN2uicdvSSxAfHas5ORR9dS8XZUnArvLU=@vger.kernel.org
X-Gm-Message-State: AFuF++lIg4WjRiJRRznqyZeVWyiMYEqKL9A7Jmdto+ipmjE6ReFL4ogg
	l46NpNozTmuzMvcK+/QMe4mr4PoXKCrXm5EmKDgr1hDUfVcsxcfBw5Yz
X-Gm-Gg: AYBFou3kr6QwfBVpiAy+sadkJjvN2e3BDQ2hvmHz1drGiWvqDiF4LpV2B+qmxka+ePJ
	H5jBMH9BnDFiAd/Pn/u6MWd56Y8GrUpXJLuxvJK+90HJShV1al4ezZmHtMT2L1mPdquh5bnxc3t
	KENeC2xlwIvkO8HP5cux5aWdmpQVLfTRnME04+ver8nL5nZ37fP4hcqwuOathpFnVg3H/E5n4OD
	4yZDct88CFF16OqgNgO84l8b9ugeHjRQ9sQV3xn7cPkDsA0u8c0NOe8nCRhHBtVs28uG87eruoe
	R0ovbRuNmMi4Os1QuGT7v9YlU2HvghVXfVZ7nfwCG7jDkTN7Q38bUAjudeMaFiQSxYxIagUqrUY
	hvsY8LQ/CC7Fiuxgqnhk2V/uOxa/zY0biCKNNuKAx9kDlE2Q0K1fzcr9kPnDsKUh3Nl4Yqxlmj9
	XDL38bxqbD0ik1LOmWeQSkDAnrF6ntEj9jyjnG+Zc2bgGlX8d9AnLXNREeWOX/OkrzD7aGzwupq
	Z299G7r3sm5Mm8SDlGk/IWbzl1iHuWMcdBfVoYRF9lwzN2EhALbpivOyMcOtjCpq4D4C/J6+foo
	XQU=
X-Received: by 2002:a05:600c:6287:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fe7babaadmr113896275e9.20.1790374760917;
        Fri, 25 Sep 2026 15:19:20 -0700 (PDT)
Received: from ?IPV6:2a02:2149:8bb5:f00:90c3:8a8a:2e7b:7fa0? ([2a02:2149:8bb5:f00:90c3:8a8a:2e7b:7fa0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a354c47sm10464218f8f.15.2026.09.25.15.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 15:19:20 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <9f0af6b6-bf78-4f4f-96c1-7e08d574b905@gmail.com>
Date: Fri, 25 Sep 2026 23:19:19 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] kconfig: tests: Reset KCONFIG_WARN_CHANGED_INPUT by
 default
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>, Ulf Magnusson <ulfalizer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
 <20260917-kconfig-tests-minor-updates-v1-1-286e5c985244@fritz.com>
 <a1efc002-c34b-43a4-be02-ff4746d13241@gmail.com> <arTSvcwLenaZwKm7@levanger>
 <179036642082.3653489.376583884931759728.b4-reply@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <179036642082.3653489.376583884931759728.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/26 21:00, Nathan Chancellor wrote:
> On 2026-09-24 09:35 +0200, Nicolas Schier wrote:
>> On Sat, Sep 19, 2026 at 06:29:39PM +0100, Julian Braha wrote:
>>> On 9/17/26 14:38, Nicolas Schier wrote:
>>>> Reset KCONFIG_WARN_CHANGED_INPUT by default for all kconfig tests but
>>>> those which set it explicitly.
>>>>
>>>> This fixes the 'warn_changed_input' test on systems with
>>>> KCONFIG_WARN_CHANGED_INPUT=1 and ensures a cleaner test environment.
>>>>
>>>> Fixes: 645323a7f4e5 ("kconfig: add optional warnings for changed input values")
>>>> Signed-off-by: Nicolas Schier <n.schier@fritz.com>
>>>> ---
>>>>  scripts/kconfig/tests/conftest.py | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
>>>> index 66f95e4ed58c..e92f0cf1421a 100644
>>>> --- a/scripts/kconfig/tests/conftest.py
>>>> +++ b/scripts/kconfig/tests/conftest.py
>>>> @@ -34,6 +34,9 @@ class Conf:
>>>>          """
>>>>          # the directory of the test being run
>>>>          self._test_dir = os.path.dirname(str(request.fspath))
>>>> +        self.default_env = {
>>>> +            "KCONFIG_WARN_CHANGED_INPUT": "",
>>>> +        }
>>>>
>>>>      # runners
>>>>      def _run_conf(self, mode, dot_config=None, out_file='.config',
>>>> @@ -57,6 +60,11 @@ class Conf:
>>>>          # Override 'srctree' environment to make the test as the top directory
>>>>          extra_env['srctree'] = self._test_dir
>>>>
>>>> +        # Set default environment variables, if not set by caller
>>>> +        for var in self.default_env:
>>>> +            if not var in extra_env:
>>>> +                extra_env[var] = self.default_env[var]
>>> Maybe it makes more sense to have the tests ignore users' env vars if
>>> they would cause tests to fail? For example, this recent patch
>>> explicitly unsets the KCONFIG_WERROR flag:
>>> https://lore.kernel.org/linux-kbuild/4d1eee3a-
>>> a5f9-467e-880e-4f2815851b09@gmail.com/T/
>>> #m25be9ad4d5e62956c5f98759398f91a555afb4df
>> Good point, but I am not sure, if we really should ignore all of the
>> user's environment.  Maybe it's better for now, to just reset all
>> environment variables that start with KCONFIG_ and KBUILD_ ?
> Given these are Kconfig tests, we could probaby just ignore KCONFIG_, I
> don't see any instances of KBUILD_ within scripts/kconfig outside of the
> Makefile. We could do both anyways and just adapt based on reports
> though, I don't really have a strong opinion on that though.

Yeah I agree with this, since I would expect only KCONFIG_* to have an
effect on the Kconfig tests.

And after digging into this, it seems KBUILD_EXTRA_WARN does set
KCONFIG_WERROR=1, but as long as we're clearing KCONFIG_WERROR, it won't
matter.

Kconfig also has the 'CONFIG_' flag, which (if set) would break
several tests, but the makefile is already clearing it for the
testconfig target anyway.

- Julian Braha


