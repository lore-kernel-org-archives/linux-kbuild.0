Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:58276 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgESKVq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 May 2020 06:21:46 -0400
Date: Tue, 19 May 2020 12:21:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 03/29] modpost: add read_text_file() and get_line()
 helpers
Message-ID: <20200519102133.GA279905@hirez.programming.kicks-ass.net>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
 <20200517094859.2376211-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517094859.2376211-4-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Sun, May 17, 2020 at 06:48:33PM +0900, Masahiro Yamada wrote:

> +char *read_text_file(const char *filename)
> +{
> +	struct stat st;
> +	int fd;
> +	char *buf;
> +
> +	fd = open(filename, O_RDONLY);
> +	if (fd < 0)
> +		return NULL;
> +
> +	if (fstat(fd, &st) < 0)
> +		return NULL;
> +
> +	buf = NOFAIL(malloc(st.st_size + 1));
> +
> +	if (read(fd, buf, st.st_size) != st.st_size) {

Is this sensible coding ? I've always been taught read() can return
early/short for a number of reasons and we must not assume this is an
error.

The 'normal' way to read a file is something like:

	for (;;) {
		ssize_t ret = read(fd, buf + size, st.st_size - size);
		if (ret < 0) {
			free(buf);
			buf = NULL;
			goto close;
		}
		if (!ret)
			break;

		size += ret;
	}

> +		free(buf);
> +		buf = NULL;
> +		goto close;
> +	}
> +	buf[st.st_size] = '\0';
> +close:
> +	close(fd);
> +
> +	return buf;
> +}
