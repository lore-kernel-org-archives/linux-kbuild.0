Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F6F44C659;
	Mon,  7 Sep 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779984; cv=none; b=I0sAUAtnoU1ax6CuHEgBVIlCybylJKtg3W6sEjipgGO5mXJw/15YljL7DDUuJCz0mr0WMjNIGpKrzPrCyupt2YLp8w0Z3ajK8CCO46Or26yTSgkE5BB31Pt9dDMty8saH0oGWxs4f3UNnRd5Rmx06gc3ITeHo+F9j8/duxBEFwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779984; c=relaxed/simple;
	bh=+dSR/hysa8DZfcl0ZDA2GmidfxxVMYCIVnc70HZUOQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5g+xEN0FrDBNALpdszTNA3WEeIRSFWEYdhphuzt3vWI7QW7U/iXhIqxWwZrb82bP/9dzsFp5NB4KQJ9YA0h1ckyS1nBppkG087LKwa1+bVZFOT81GrWHGszFnRkJ+Umc6yEaykUSuAaViq04UYZ+MMmVcqcxm9XOzk4WDZEtC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=T9aG0Ghf; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="T9aG0Ghf"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8C5E3ED97;
	Mon,  7 Sep 2026 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1788779974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C0T4Myw0mRKoLxLGHy5CPuN0XghUkP1OHcSHIPoIbxQ=;
	b=T9aG0Ghfi0erPuiWQdkxLa/7Ap2ACAcqeflatjyo89b5hxGpELemxJy57dOl1wRMsTV9bZ
	mAsmR4pC7NkfPVVFKEliCfrJXrKiHVvY5ppZrZGDobQn5hS/4/8/VfcQmvV093kXYydAxR
	GjKCQZt6o76vi40lxe6nLrP7KjJjgxKOXdex3fIMhh2USF+Tv8WaIV+fFzPlW23WdTUW47
	BC0sBqjJRSwm+MTHOyZBFiDeZhRw2CI5Y2WywlQa7DkNF65Zr5Wi1j9AY0/AXF7DALYc3g
	AXml/jo8CH23VEwLDc6qmvEisjWJJ0Cu5hrWT3qf6yvR/1TxVHfgowMBM7tdIg==
Message-ID: <b2e8fda1-c41b-4b75-8d00-b38d8ed5be60@gtucker.io>
Date: Mon, 7 Sep 2026 13:19:32 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 1/3] scripts: add TOML config to container tool
To: Nicolas Schier <n.schier@fritz.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 kernelci@lists.linux.dev, automated-testing@lists.yoctoproject.org
References: <0a88d9d0ebd73a9f6e72399f93705ebc7b49ae9c.1788341513.git.gtucker@gtucker.io>
 <20260904-invaluable-nifty-salmon-cf7767@l-nschier-aarch64>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <20260904-invaluable-nifty-salmon-cf7767@l-nschier-aarch64>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: dmFkZTEwaq49mBsdFxqB93WfPbbzZWaQMBlaE/9x0v5BSrX7GlT3Bd92d5Xn6lPWEFvOhoIFQLO4PUZTIs0MAuQFsKUM8cScwhHYgbXX1PlLEqADClVWpwLjEnRvbLryMyMrS4WXVcWyzZxsrP6nruYDav7Fp/tc8PJDDDytMB7ny+Onueb8OVxroGB12secYTHHF3oI6719PzSqHvH+bZhBzc6MnI6OBmtOzcYv8d9LnJ/VOX1xxS+vaUeHr2H2SIZ776+yNG0193673hAUTHEKDJUrh5ukPDYWDK2s5hGtiVq1QWXoUsM+BfBgcPdpGK0nHKnb/i5f8wfiXFMFM0sRYA7JIjuCQD7oNGD3IosXzkJ0+Z8r6g+3v5GCnxutk3EjPzOmibfoRh8olL42zRSen3eIMp9mQd1/SLEM2jE8XgVM9pLdyh7GURQsfYY28Z/n2rZlnRgQYeJuw0kKmC3eZ7Gz5U0pqQKaQirOAicyFoh9GTq6BHl1BCQJe3iiEVCxSNWO8aZLxUB2180qGfxRxSvmsXmwwwvziyyHyIi39zkL2T6jfICGBPCQwe39X7uw0A4pEmqeOpEWqXFZf0jPDNIQunq2T66xt1qtVHdtn2Y3YZGOIakakjZYHXwVjNlz6lG1hopAs0EItffd1f4KMJaYsXYa2B/QTo1Y+kmke1CH5g
X-GND-State: clean

On 04/09/2026 21:19, Nicolas Schier wrote:
> On Wed, Sep 02, 2026 at 11:33:00AM +0200, Guillaume Tucker wrote:
>> Add support for a TOML configuration file to the scripts/container
>> tool.  This improves user experience by not having to keep passing the
>> same command line options all the time or overly relying on built-in
>> default values.  Include the concept of 'profiles' with different
>> named sections in the file to cover various use cases.
>>
>> Command line options take precedence over the config file, and values
>> defined in profile sections take precedence over the default one.
>>
>> Add a -c option to override the location of the .container.toml config
>> file which should otherwise be located in the current working
>> directory.  If not found, the file is silently ignored as it is not
>> strictly required unless the -c option is used.
>>
>> Add a -p option to choose a particular profile section in the config
>> file rather than the default.
>>
>> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
>> ---
>>
>> Notes:
>>     Changes in v2:
>>     - fix uid / gid handling when set to 0 (root)
>>     
>>     Changes in v3:
>>     - fix logic when loading config profiles using None
>>     - fix typo with missing whitespace in help message
>>     - clarify how UID gets used as default value for GID
>>
>>  scripts/container | 89 ++++++++++++++++++++++++++++++++++++++++-------
>>  1 file changed, 77 insertions(+), 12 deletions(-)
>>
> 
> Acked-by: Nicolas Schier <n.schier@fritz.com>

Thanks.  Please note that I carried your Acked-by in the v4 I just
sent which drops the 'registry' option from the TOML config as it was
causing ambiguous situations when providing a full image name that
contained a registry.  The rest of the patch was left as-is.

Best wishes,
Guillaume

