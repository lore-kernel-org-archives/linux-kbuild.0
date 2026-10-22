Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691670;
	b=0aDXbULeaPNCZ5gOWBdOFyyo3wZVZ9a8jKUIXwPSuYK89dD32RX1kT7eQfZB8C5SM8ds
	 gyHlTXhK1EUMDEs88s8qkRYcCthuJ+8kvpa1Vu43jOdrR5Lq8EzKDWUJXVdt+UnIhqq0S
	 ARDUIz6jIb83/Z7gbjse68aeoEY1l59fe7+8gH03IrAJ3ZmmXdqP3sbN4XBEgky1ADtMP
	 yIn09xYxWpeiMV6awVh6rJ5r4I0ZoLQgE+W9wtFjZEfuA4c4bYDCG4O9KSMs7VXExOoyU
	 6q4oCCPNvF/Y9qf7E8e9I3hTg5Y5D8HbcqWlBGfzxl5oMDkxOcdiNO9aNO4/HBUuS8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691670;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fbQibgxe69xuj6Tt/lcZHC3t8YlgVovN8bS/Jv4bVys=;
	b=vqgAis3ApMNs0oTuEs6CSc+I67dfraon0K2s2wQTN6ZVIvRCLK/MCau6sMr6Kjh2rj2o
	 pAkBbsbtgYT69moWgqyx0GXEiNe0zCQbCYJaFKOWCRXTqN3+7YnvXpoeGD/OdrtbfyOnM
	 Kocy1IBhKVm5oeSX8l2V1NIJCcVkz0o/N3laaRZCr377OLuVR6Wr1O6/socifOOA1p1Vj
	 GlGqJnkYJAjrpUO02l6YRnEHTWjd5TFNBnLim6QyeqFVm6A4Va5BC92tuMil1I9jDQzE7
	 1dadWuW+nUduElnX/OZ6nkJJZj8mDbK+p3rAZWnZFickhdWM/apwuGu9P3tD2j6XfZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zIcaFNGy;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC35E606A31A;
	Thu, 22 Oct 2026 17:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC35E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zIcaFNGy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=fbQibgxe69xuj6Tt/lcZHC3t8YlgVovN8bS/Jv4bVys=; b=zIcaFNGyaMsCr9M0ia4+IPE/tX
	At2HmdCrlpXOBQ2UyTUdnLUz5SvfLafFw10+N3to7x62m9+QhA7bAWAh/pFkG8hhgIpnxmIBiFfEH
	xY90xURt7SvBjfa0W9XxmVqXd8+ys34f0CHpn1ZkAyoAFSw91p34YhxVSmfBpGB1fLCki/vGDw80f
	DYRQhK0UzSSruakLqJVzk7iMCwxplhko4XmI4z35ZLwx0l0U/Ld/yCQgvuyncDj7l6CRdKhHzaItL
	r0R2dC76Cbw1stEFGeuo5NVLmphxr8JI/sEPLRxvzlHK9d5qSlUloJ180gBjX1DlpCn8q4F+ovQHq
	tAB8lFug==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwzh-0000000Ef54-0yRY;
	Thu, 22 Oct 2026 17:54:25 +0000
Message-ID: <3ea9c3c7-a5b8-4474-b2c6-c500cea29487@infradead.org>
Date: Thu, 22 Oct 2026 10:54:17 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] changes.rst: introduce 'Required for'-column
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kbuild@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-debuggers@vger.kernel.org, tools@linux.kernel.org,
 "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nicolas Schier <n.schier@fritz.com>
References: <20261007163736.3942745-2-manuelebnerli@mailbox.org>
 <d57ce591-2399-4bd4-ae70-8fdabf63ae82@infradead.org>
 <6cfc3d91f725146c6d8c6c21b869b1d21a08044e.camel@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <6cfc3d91f725146c6d8c6c21b869b1d21a08044e.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/22/26 2:36 AM, Manuel Ebner wrote:
> Hi Randy, 
> 
> On Wed, 2026-10-21 at 22:41 -0700, Randy Dunlap wrote:
>> Hi,
>>
>> On 10/7/26 9:37 AM, Manuel Ebner wrote:
>>> The optional tag isn't obvious nor defined. Therefore remove the tag and
>>> add column 'Required for' to make it easier to define the need for the tools.
>>>
>>> CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>>> CC: Nicolas Schier <n.schier@fritz.com>
>>> ---
>>> If anybody has info to add to or refine the new column I would appreciate it a lot.
>>> Please forward this to list or people which can contribute to this patch.
>>>
>>> There's also the option to remove the 'Command to check the version'-column
>>> and refer to scripts/ver_linux - and with this also removing the duplicated
>>> information-issue.
>>>
>>> [v3]
>>>  Rearange column space of the table in order to add column instead of replacing column
>>>  add some requirements to the table
>>>
>>> [v2]
>>>  Ditch footnotes in favor of a column
>>>  Replace 'Check Version Command'-column with optional-column
>>>  https://lore.kernel.org/all/20260831152523.638881-1-manuelebnerli@mailbox.org/
>>>
>>> [v1]
>>>  https://lore.kernel.org/all/20260812122426.1636227-2-manuelebnerli@mailbox.org/
>>> ---
>>>  Documentation/process/changes.rst | 97 ++++++++++++++++---------------
>>>  1 file changed, 51 insertions(+), 46 deletions(-)
>>>
>>> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
>>> index 28f2ca633..dafe0530f 100644
>>> --- a/Documentation/process/changes.rst
>>> +++ b/Documentation/process/changes.rst
>>>
>>>  
>>>  ...
>>>
>>>  
>>> +==============  ========  =======================  ========================================
>>> +    Program     Minimal      Command to check                  Required for
>>> +                version         the version
>>> +==============  ========  =======================  ========================================
>>> +bash            4.2       bash --version           general requirement
>>> +bc              1.06.95   bc --version             Kbuild (
>>
>> Something missing after the '('?
> 
> There's something missing because I didn't know what to put there. I know bc is calculating
> something during the build, but now how to put it.

Some concise summary of:

bc is used to generate kernel time constants (depending on CONFIG_HZ) for all
architectures.
bc is used to build a static OID registry for fast lookups.
bc is used in package building.
bc is used in lots of testing:
* BPF
* ftrace
* math
* perf
* CPU
* networking
* kernel stack
* memory hotplug
* zram


>>> +bindgen         0.71.1    bindgen --version        CONFIG_RUST=y
>>> +binutils        2.30      ld -v
>>> +bison           2.0       bison --version          Kbuild (.config)
>>> +btrfs-progs     0.18      btrfs --version
>>> +Clang/LLVM      17.0.1    clang --version          alternative to GNU C (gcc)
>>> +e2fsprogs       1.41.4    e2fsck -V                ext4
>>> +flex            2.5.35    flex --version           Kbuild (.config)
>>> +gdb             7.2       gdb --version            Debugging
>>> +GNU awk         5.1.0     gawk --version           objtool, CONFIG_SYSTEM_BLACKLIST_HASH_LIST=y
>>> +GNU C           8.1       gcc --version            alternative to Clang/LLVM (clang)
>>> +GNU make        4.0       make --version
>>> +GNU tar         1.28      tar --version
>>> +GRUB            0.93      grub --version ||
>>> +                          grub-install --version
>>> +gtags           6.6.5     gtags --version          to generate tag files through ``make gtags``
>>> +iptables        1.4.2     iptables -V
>>> +jfsutils        1.1.3     fsck.jfs -V
>>> +kmod            13        kmod -V
>>> +mcelog          0.6       mcelog --version
>>> +mkimage         2017.01   mkimage --version        Flat Image Tree (FIT) or ARCH=arc, arm or powerpc
>>> +nfs-utils       1.0.5     showmount --version
>>> +openssl         1.0.0     openssl version
>>> +pahole          1.26      pahole --version
>>> +pcmciautils     004       pccardctl -V
>>> +pigz            2.4       pigz --version           Compile and boot with KPGZIP=y
>>> +PPP             2.4.0     pppd --version
>>> +procps          3.2.0     ps --version
>>> +Python          3.9.x     python3 --version
>>> +quota-tools     3.09      quota -V
>>> +Rust            1.85.0    rustc --version          CONFIG_RUST=y
>>> +Sphinx          3.4.3     sphinx-build --version   build kernel documentation
>>> +squashfs-tools  4.0       mksquashfs -version
>>> +udev            081       udevadm --version
>>> +util-linux      2.10o     mount --version
>>> +xfsprogs        2.6.0     xfs_db -V
>>> +==============  ========  =======================  ========================================
>>> +    Program     Minimal      Command to check                  Required for
>>> +                version      check the version
>>> +==============  ========  =======================  ========================================
>>
>> On my build of 'make htmldocs', the table ending confuses docutils.
>> Did you build this with 'make htmldocs'?
>>
>> Documentation/process/changes.rst:73: WARNING: Blank line required after table. [docutils]
>> Documentation/process/changes.rst:75: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/process/changes.rst:419: ERROR: Malformed table.
>> Bottom border or header rule does not match top border.
>>
>> ==============  ========  =======================  ========================================
> 
> I'll remove the bottom 'head-row'.

Ack. Thanks.

-- 
~Randy

