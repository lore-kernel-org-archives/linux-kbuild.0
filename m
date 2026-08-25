Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0EE175A7F;
	Tue, 25 Aug 2026 03:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787628168; cv=none; b=kL9mfmuhvGGaZMQ2ya0XqALarcMHpiNmIAVij1gDl0IrV8UmvZFv/Vjvs8MhYeZhNWZDQ3eD2/fwY1DtiT6MLVcmsiz/5bzAHh2/oGJN+VEHI7cUFJlOvLKDY186Gmo4Ql79fiR/2k+BiZncCbYUuIF0MQG7pjnBlXwg0FWq1So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787628168; c=relaxed/simple;
	bh=KMJtrz/eMBecnjqDD1Hf25wV4WI8+mv0g/sCyomHWbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0s0tTQPpFub3NVX/kj2tImikBd1QetfqgvqhvwxeiOt+kYi456g3KkfGEtJ7RuK+FDW83vE2cSJPBXe5VWfi/kAHE/MtG5njJDhVFMZI24nZ2Engq8wg4XTdSYXdGUq8YGBY71ZkqIwxAoYzkPBhqssRt1GLgEC33KD7mWeOVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auk1hMmB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auk1hMmB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F671F000E9;
	Tue, 25 Aug 2026 03:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787628167;
	bh=CoLys0TPnYYOOvKQGZbpCgYY5//FIktP0zWDsv7ZMm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=auk1hMmBlzEszlSccN54JIg0MmJiw+L2pGN6PygzTu8+cDLSJm2bF+LHjGMqQxJUV
	 5xmD0THsy61uHS4t1ENFGcfWaesgUPoD8Y0I4XPDzv+cukoDkB4UXobkhtiu7x6qdj
	 kL4t+FQyTmqP4t2/szh+01Ua0kjPnLTupj3V5h8OeqPFt1q61vJrvBHxUGZAtkTkk+
	 K5AnvXvDgHq7MRzAYB7iy6PESZKFZx3jy+iUXyO/pFjIFGbt4ckFSK5GvCsF1inkPR
	 zTfFVsxQ2DCM3MCvAOI2s0+Da5dH+waQLT4LaOXCGWz1dZllF/GJTu+zZsNgJ6iZ/a
	 AFRPqSZ6zHIiw==
Date: Mon, 24 Aug 2026 23:22:42 -0400
From: Nathan Chancellor <nathan@kernel.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH 1/1] kbuild: record real-prereqs in .cmd files
Message-ID: <20260825032242.GA1218443@ax162>
References: <20260814112134.832243-1-luis.augenstein@tngtech.com>
 <20260814112134.832243-2-luis.augenstein@tngtech.com>
 <178708267641.2113250.8208366109143651745.b4-review@b4>
 <1efb52b4-1a78-4c4e-aea1-6c8b426a8538@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1efb52b4-1a78-4c4e-aea1-6c8b426a8538@tngtech.com>

On Fri, Aug 21, 2026 at 09:57:03PM +0200, Luis Augenstein wrote:
> True, some Make prerequisites also appear in deps_*, so the filter
> dropped them from make_prereqs_* on incremental builds.
> 
> However, we cannot just remove the filter. After the .cmd is included,
> $(real-prereqs) contains $(deps_$@), so the whole deps_* list would
> show up in make_prereqs_* on a rebuild.

Ah, makes sense.

> We could move the filter into fixdep and filter based on the new .d file, so
> the overlap is removed already on a clean build.

If this is not that complicated, I would not mind seeing what it looked
like.

-- 
Cheers,
Nathan
