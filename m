Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F6B3BB57;
	Tue,  3 Feb 2026 06:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770100140; cv=none; b=TZeHT3a6H1Xd6p1yzgZySad8g7oMknvTEVDlW1VDneI3oEqiFMKEvucLkBOmKBQrt+pZ2fNTXsBU0fwnSg63Z/FISSPo2yXVCCxmglZ15vc2PqeUcCR3zFBGDCc6tYwwPURJe0DJwer32O0AsizFJlbA2sbB6wc+k7tyVZb2xug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770100140; c=relaxed/simple;
	bh=aNx2LAkP+sIrTt+/d6vSZFT92X+Um3PGs2SPx9DbSC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=goT8REU8ciEBpWePSyr4GaFgVAJvx+wJ5CciQLVdk0tyrdWi4CkuJQXUb4svHwZ0lcMuBiTRTm5Ykl3T9TvfMS+TnZjQgqXWvFUK+t2dVw3yRSSvuQpqTS36wWSowxgDbw79g41pm6VyHcZKzGvP9k5ppPfl8NEAOvlI6aeBzlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=PHBOq8Ui; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="PHBOq8Ui"
Received: from [10.95.64.228] (unknown [167.220.238.132])
	by linux.microsoft.com (Postfix) with ESMTPSA id D921E20B7169;
	Mon,  2 Feb 2026 22:28:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D921E20B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1770100139;
	bh=qMRJYUFZspHnxLu+LC/ZJN4xOqd6zE3i2hTsVolBFMY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PHBOq8UijOdSljRE5R6MqpGKaF/+hnU/3EJUTHWsSZKbvYtCdUkiP7shsnh7Tef40
	 tYx793xDPbR0b0SHUSv+6SxpSh+BwnjFXYzx/polksIplQPcAH4m063yLgSlfkcPs8
	 apRAeR1gXnXKxrtQtiDlfJi8bsSug+HDzKMYVpOA=
Message-ID: <cd0e4ca5-542c-42db-bd7c-c63f5df85fc5@linux.microsoft.com>
Date: Tue, 3 Feb 2026 11:58:51 +0530
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] kbuild: Make --build-id linker flag configurable
To: Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>
References: <20260202110631.978412-1-namjain@linux.microsoft.com>
 <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
 <20260202231508.GB2319189@ax162>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <20260202231508.GB2319189@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/3/2026 4:45 AM, Nathan Chancellor wrote:
> On Mon, Feb 02, 2026 at 03:15:30PM +0100, Thomas Weißschuh wrote:
>> On Mon, Feb 02, 2026 at 11:06:31AM +0000, Naman Jain wrote:
>>> I am trying to implement reproducible builds for one of my product
>>> kernel. I referred https://reproducible-builds.org/docs/build-path/
>>> and tried to use both -fdebug-prefix-map=OLD=NEW and
>>> -fmacro-prefix-map=OLD=NEW, but still could not achieve bit by bit
>>> binary reproducibility without overwriting build-id to none.
>>> If I move the kernel to same path in other setup, I was able to create
>>> same binary hash, however, without it, there is some difference in
>>> build-id hash values.
>>
>> Can you force the same build path during package building?
>> That should avoid this issue.
> 
> Yeah, I think that it would be better to document this in
> Documentation/kbuild/reproducible-builds.rst, as opposed to adding a
> hack to disable the build ID altogether. It seems easy enough to make
> the paths consistent between machines and environments by using a
> container or such. The new scripts/container in -next could help there.
> 
> Cheers,
> Nathan

Thank you Nathan for your inputs.

I'll plan to ensure same path for my kernel build, and send a patch to 
add this in reproducible builds documentation.

--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -58,6 +58,9 @@ to an absolute filename in an out-of-tree build. 
Kbuild automatically
  uses the ``-fmacro-prefix-map`` option to prevent this, if it is
  supported.

+If it still does not work, ensure that the kernel is built in the same
+directory, using containers or such.
+
  The Reproducible Builds web site has more information about these
  `prefix-map options`_.



Regards,
Naman
