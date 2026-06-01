Received: from sender-op-o4.zohocloud.ca (sender-op-o4.zohocloud.ca [199.67.87.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F73827703;
	Mon,  1 Jun 2026 04:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=199.67.87.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780287825; cv=pass; b=T/m/e9dff5nZinwIUQrTtWdyHxgC+5djdzc8BtrUOpqea6u0l+DoVB+kzTDusmOVaRG35MXugnP31I8vINh8RlJL7lEobeHTaPPKjg6fYrUrgv+VX6OUiIpHb3HN6XoUgrwdJnMnQf63fZeyWnOwRB13eA/wnsHEgHJN+BHTc58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780287825; c=relaxed/simple;
	bh=TF09/NrJmUAwpv65h8ne7Tku8ioAWNDLt9NLHvyX6GE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQJ4VMZKck0dQSgE9P4lyzsxG3SevwyKadkSAiemlFEp0AV9YEDp9W8O0CBySqKTcxfqYbOn1mE7cFziyEhS28Oe0W9xbzUVQp2FPSfhBzgOcqnA8XZ/HwiBEXhSoCkBYw4J+18qmg4phXDEfh0hcGw6jQwKHt6s3SoPdqZHrTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jkam.dev; spf=pass smtp.mailfrom=jkam.dev; dkim=pass (1024-bit key) header.d=jkam.dev header.i=contact@jkam.dev header.b=ZLifD4ik; arc=pass smtp.client-ip=199.67.87.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jkam.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jkam.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jkam.dev header.i=contact@jkam.dev header.b="ZLifD4ik"
ARC-Seal: i=1; a=rsa-sha256; t=1780287794; cv=none; 
	d=zohomailcloud.ca; s=zohoarc; 
	b=b3Act+OvykorxVhgcr/hToxyNsQRXlMfjHeCbaW9GRMGMIQVZUQM3EofS0vrfzlAmjhc8ZTm0BIXMzuO0a8S1Gbd1AIfbDNCaHnq8TxHq+EFm64shmPeUdM/1Gl9Akhn59SzvpddjdGqdBLzTxWEB77PXB+qQG6Nkei1+6OEHvM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomailcloud.ca; s=zohoarc; 
	t=1780287794; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=e3aBQCBuTARdNquUwrw0JRwaghnkAFQ/yfJjOQPrekQ=; 
	b=mTNj7Z0cP5gPKKdbtJyITDeRevpIhXEWxNuH7KiyFhMDyOAJYESOOtuvPihHB8PtOz/gsI2NZlimPzgvLf/1+MW49iLBIc5uGHKnbsWvjTww63/RALraX/bu0NyXeNMx4qIiv+991pJSgIMVl4j72sOdVl7G5MspliT7HMHu0Zc=
ARC-Authentication-Results: i=1; mx.zohomailcloud.ca;
	dkim=pass  header.i=jkam.dev;
	spf=pass  smtp.mailfrom=contact@jkam.dev;
	dmarc=pass header.from=<contact@jkam.dev>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780287794;
	s=zoho; d=jkam.dev; i=contact@jkam.dev;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=e3aBQCBuTARdNquUwrw0JRwaghnkAFQ/yfJjOQPrekQ=;
	b=ZLifD4ikty3yyTrEtRa8ijjRHEu9qdJ0x8vIiUl6Tlhf6ai4LihA/6PKXPrzX19M
	Jdu4dNkdHBIItc9BgpQ/nD1T9/PjnBMlSZS7Yc4tf0qsf1aUmfy4FqqCyYNkw0Hk1Gv
	Mj9Luk6cQM2jNOY07WxtDyUHDk7i4JX6XxVmgX7k=
Received: by mx.zohocloud.ca with SMTPS id 1780287793365171.15998397581893;
	Mon, 1 Jun 2026 00:23:13 -0400 (EDT)
From: Joel Kamminga <contact@jkam.dev>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	contact@jkam.dev,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v3] kbuild: rust: make `*.long-type-*.txt` a target for cleanup
Date: Sun, 31 May 2026 22:23:04 -0600
Message-ID: <20260601042304.73316-1-contact@jkam.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CANiq72=huc=AfjBRYUsoJY1hSvB8W6CvnUh7g2G4rt98XYmxYw@mail.gmail.com>
References: <CANiq72=huc=AfjBRYUsoJY1hSvB8W6CvnUh7g2G4rt98XYmxYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 2026-05-31 00:45, Miguel Ojeda wrote:
> In general, please add a changelog after the `---` line. Otherwise,
> reviewers need to manually inspect the patch to see what has changed,
> if anything.
> 
> For instance, I see you changed the title, but the commit message
> seems identical. Was there a reason to not change it?

Hi!

Thanks for the comments and tips. Just for future reference for myself,
in regards to applying changes strictly to the metadata of the patch
(i.e. adding a changelog but leaving the actual code unchanged), is it
preferred to just resend the same version of the patch with the
changelog added instead of creating a whole new version? That was the
impression I got reading through some earlier patches, but seeing as
I've been creating new patch versions and haven't been told to do
otherwise, I figured I'd double check.

Thanks,

Joel
