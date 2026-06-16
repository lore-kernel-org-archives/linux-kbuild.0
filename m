Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513AB37CD31
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 20:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781642180; cv=none; b=ZL4Sxn8Z+zwWn58zzJrsII5Q/JcDKSKHd6RaZRMHdupxmKwcsgdSCCJJcFU5EaGfh+n1i+hZbfXA73Pi8CSNbI/Gs9Xz3sA5eQzJtX0ZlkTDvbES6fiI1eaSfnYw89BFtBL0bVg7d47UcQ+jUk0GLicIIWAwD9FFZObMvp58cKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781642180; c=relaxed/simple;
	bh=3a6QGVL1NJGGjcuG+JbeLXgQBtAqa3XFntTl5D4POJk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Dwp3f1a8E4BtAgMNnIEfKVueiFaIirjeyGnOydpl3OL5LKD/43x97g6sF7Gqu2B5TgZ47o6leP/7N8OpTunkjbwK358LwUNCx92ggLGg7NY4VREz6kMb/wrmNcrmKP9sYKldr3jL+bFnGjcwRf6yOaNwKpzPxZSHC5Cae9lh2+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=yVPpQ7A3; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="yVPpQ7A3"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-137eb0d76beso219971c88.0
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 13:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781642177; x=1782246977; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBxdOpPpriEZaP7+dJF5PIZRLf+JcU7MYCnzzOWXUrs=;
        b=yVPpQ7A31tCvWsDarHMLxj7WDqjHdjvhHlc/A1umPTkKsTCL4/22NnLO54nDgADq5q
         rR4IqCEYHDhgtCLr6mbMbKhHX+tfLZPOzKJGmouX0734cK6U6iU6BVervQeb6Vru93U3
         qE5VTMhC0MEAOo+sLL2mnDkW7KrwHCC77zWzwZNrZS5ebl19KwKi++3LpWPxs8uu516j
         jB/TXnUWQsJlIVTQSvxvjPs0Eh3UYXbniDd0gnOCEhtWd4GFbi4B3jmpftiXrk7lVG1A
         YKw11eu+hVZT2p3037vyJ82zEKV+5LMlnW9IQUfIg9oR24C9F17JLgg2DJ4tXbJNceom
         kPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781642177; x=1782246977;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBxdOpPpriEZaP7+dJF5PIZRLf+JcU7MYCnzzOWXUrs=;
        b=AyPwyHSpP00DlPH1j7P9DcfLy4GKLnbmz7u/aqfXtdvDEbLsmb37q7V6ghcxQLL1Kd
         tqDG5yxmsd8iXIFIJrhqgEJiUHi12AmPCiMbQbIrHEev2DxYXpBYBqe8hUbeQGCinGa5
         sT2WOD3H9QIXQ2QnFCRkg5Vw36Iczx0BbRcdryoWkUv+UKeqIHEtew50UzJS9YCtf45A
         4Y9dX1AnQge8zQ/EpDECVpe8h3mAURMc4iLK24uo3EB2YAzV1ebvr/Rxt5i98GY6M1Ou
         sdU6XJMx+ZyVb/aFiG/ANa3rPi/JK3UyY4eMVWzrYN104gc9yYvk3ql6lrQvMUbonCI5
         6nWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ai1+WsxypXIKXKbP+MS1wetuFaZfHvtRXltaljB41b7MbWEAABy90nFY8ntug/TvcyU3WzxmxA0IUoPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsbWf8BHZgYZy8FlSJGeX7QA1vO6QTBz/sb8zMesXNOKs346T5
	+0w2HMdZK2+PbQoA2UxvjclIC8GDHvuRs06b+4KoG7hG8Mh+dBGIrmr+emPefvCOepU=
X-Gm-Gg: AfdE7cmbZm01oA2ahCyr9otH7wvFlo8FBMepM8KLxx0gcCHo1Q757YL8NJp1RqkzZHs
	28+qgVnUrZgPg9QH/rjlau3CWLYbSKxjPpnFCEz8fhk1XJp9giCiMW+8DdGqvE8b7NjG/pqPyRz
	fZbyVCnwyzrFq6RG/cMI+bAdUkeLOXHV+JpJWQXobEnt8xa8j9SoFXip/VzHAkE9wMqEZLRynAl
	Kf0SOZ2xlIYsrlUw8tX5B2/zU9YrW0AdpmXAyRVwfc//2BiPXasvDgLVBLGErov0ozfKh9YVbFO
	znZCpI4kYSFw2928kmUzaykA9uVLy+kBoURBSMgxYqGYRzfEMhXBI4X/aXx2nfITJuhrziEzzk2
	LKBpACUjT8HbBSGTMuLsRUQ603kq9ub2asFuK/7q1ksX5QMbDjHnBaMdEiUs+E40+QbxgBMqtyv
	NoacG0
X-Received: by 2002:a05:7300:6d2b:b0:30a:e52f:9b99 with SMTP id 5a478bee46e88-30bce88dc80mr216247eec.0.1781642177290;
        Tue, 16 Jun 2026 13:36:17 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::1a8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ba6b7f840sm6282744eec.19.2026.06.16.13.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 13:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 16:36:09 -0400
Message-Id: <DJARFTIX5QQV.2F5ZEUTS7IBO0@etsalapatis.com>
Cc: "Alan Maguire" <alan.maguire@oracle.com>, "Jiri Olsa"
 <jolsa@kernel.org>, <bpf@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 11/14] resolve_btfids: Process KF_ARENA_*
 flags in resolve_btfids
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Alexei Starovoitov" <ast@kernel.org>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-12-ihor.solodrai@linux.dev>
 <DJAQHH1BGTIN.IKCRPQQXBBT1@etsalapatis.com>
In-Reply-To: <DJAQHH1BGTIN.IKCRPQQXBBT1@etsalapatis.com>

On Tue Jun 16, 2026 at 3:51 PM EDT, Emil Tsalapatis wrote:
> On Mon Jun 1, 2026 at 6:18 PM EDT, Ihor Solodrai wrote:
>> For kfuncs flagged KF_ARENA_RET, KF_ARENA_ARG1 or KF_ARENA_ARG2,
>> address_space(1) attribute (type tag with kflag=3D1) needs to be emitted
>> to BTF for the return type or arg type respectively.
>>
>> So far this has been done by pahole [1].
>>
>> Implement the emission of the arena attributes in resolve_btfids: for
>> flagged kfuncs create a new function prototype with updated BTF types,
>> adding tags as necessary.
>>
>> Similar to decl tags emission, the transformation is idempotent: if
>> the types are already tagged with address_space(1), it's a noop.
>>
>> [1] https://lore.kernel.org/dwarves/20250228194654.1022535-1-ihor.solodr=
ai@linux.dev/
>>
>> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>> ---
>>  tools/bpf/resolve_btfids/main.c | 131 ++++++++++++++++++++++++++++++++
>>  1 file changed, 131 insertions(+)
>>
>> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/=
main.c
>> index f276200b1a68..aafbcfec755b 100644
>> --- a/tools/bpf/resolve_btfids/main.c
>> +++ b/tools/bpf/resolve_btfids/main.c
>> @@ -162,6 +162,9 @@ struct object {
>>  };
>> =20
>>  #define KF_FASTCALL (1 << 12)
>> +#define KF_ARENA_RET (1 << 13)
>> +#define KF_ARENA_ARG1 (1 << 14)
>> +#define KF_ARENA_ARG2 (1 << 15)
>>  #define KF_IMPLICIT_ARGS (1 << 16)
>>  #define KF_IMPL_SUFFIX "_impl"
>> =20
>> @@ -1294,6 +1297,128 @@ static int ensure_decl_tag(struct btf2btf_contex=
t *ctx, const char *tag_name,
>>  	return push_decl_tag_id(ctx, new_id);
>>  }
>> =20
>> +static bool is_arena_type_attr(struct btf *btf, u32 id)
>> +{
>> +	const struct btf_type *t =3D btf__type_by_id(btf, id);
>> +	const char *name;
>> +
>> +	if (!t || !btf_is_type_tag(t) || !btf_kflag(t))
>> +		return false;
>> +	name =3D btf__name_by_offset(btf, t->name_off);
>> +	return name && strcmp(name, "address_space(1)") =3D=3D 0;
>
> The type is just called "arena" - address_space(1) is a different
> attribute that is consumed by the compiler and is not visible in the BTF.

Nevermind, this is PEBKAC - please disregard. This is _completely_ differen=
t
scenario, none of the above applies. Same for the documentation patch.

>
> While we're at it, can we factor the name out into a #define?
>
>> +}
>> +
>> +static s32 ensure_arena_tagged_ptr(struct btf *btf, u32 ptr_id)
>> +{
>> +	const struct btf_type *ptr =3D btf__type_by_id(btf, ptr_id);
>> +	s32 tag_id;
>> +
>> +	if (!ptr || !btf_is_ptr(ptr))
>> +		return -EINVAL;
>> +
>> +	if (is_arena_type_attr(btf, ptr->type))
>> +		return ptr_id;
>
> Another thing: Clang (very very) recently got support for adding
> btf_type_tag for typedef'ed types. Do we nned to expand the check
> to run in a loop like so:
>
> while (btf_is_modifier()) {
> 	if type_tag()
> 		test();
>
> 	follow the chain
> }

Ditto, completely different scenarios.

>
> to find tags hidden within typedefs?
>
>> +
>> +	tag_id =3D btf__add_type_attr(btf, "address_space(1)", ptr->type);
>> +	if (tag_id < 0)
>> +		return tag_id;
>
> Same here wrt name.
>
>> +
>> +	return btf__add_ptr(btf, tag_id);
>> +}
>> +
>> +/*
>> + * Build a FUNC_PROTO for @kfunc with each arena-flagged return/paramet=
er
>> + * pointer tagged with address_space(1). Pointers already tagged are ke=
pt as is.
>> + *
>> + * If nothing needs tagging, the original proto id is returned unchange=
d.
>> + * Otherwise a new FUNC_PROTO is created and its id returned. The origi=
nal
>> + * proto may be shared with sibling FUNCs, so it must not be modified i=
n place.
>> + */
>> +static s32 ensure_arena_tagged_proto(struct btf *btf, struct kfunc *kfu=
nc)
>> +{
>> +	const struct btf_type *func =3D btf__type_by_id(btf, kfunc->btf_id);
>> +	u32 proto_id =3D func->type;
>> +	const struct btf_type *proto =3D btf__type_by_id(btf, proto_id);
>> +	const struct btf_param *params =3D btf_params(proto);
>> +	u32 nr_params =3D btf_vlen(proto);
>> +	s32 arg0_type_id =3D nr_params > 0 ? (s32)params[0].type : -1;
>> +	s32 arg1_type_id =3D nr_params > 1 ? (s32)params[1].type : -1;
>> +	s32 ret_type_id =3D proto->type;
>> +	s32 new_proto_id, id;
>> +	bool changed =3D false;
>> +	int err;
>> +
>> +	if (kfunc->flags & KF_ARENA_RET) {
>> +		id =3D ensure_arena_tagged_ptr(btf, ret_type_id);
>> +		if (id < 0)
>> +			return id;
>> +		changed |=3D id !=3D ret_type_id;
>> +		ret_type_id =3D id;
>> +	}
>> +
>> +	if (nr_params > 0 && (kfunc->flags & KF_ARENA_ARG1)) {
>> +		id =3D ensure_arena_tagged_ptr(btf, arg0_type_id);
>> +		if (id < 0)
>> +			return id;
>> +		changed |=3D id !=3D arg0_type_id;
>> +		arg0_type_id =3D id;
>> +	}
>> +
>> +	if (nr_params > 1 && (kfunc->flags & KF_ARENA_ARG2)) {
>> +		id =3D ensure_arena_tagged_ptr(btf, arg1_type_id);
>> +		if (id < 0)
>> +			return id;
>> +		changed |=3D id !=3D arg1_type_id;
>> +		arg1_type_id =3D id;
>> +	}
>> +
>> +	if (!changed)
>> +		return proto_id;
>> +
>> +	new_proto_id =3D btf__add_func_proto(btf, ret_type_id);
>> +	if (new_proto_id < 0)
>> +		return new_proto_id;
>> +
>> +	for (int i =3D 0; i < nr_params; i++) {
>> +		s32 param_type_id;
>> +		const char *name;
>> +
>> +		proto =3D btf__type_by_id(btf, proto_id);
>> +		params =3D btf_params(proto);
>> +		name =3D btf__name_by_offset(btf, params[i].name_off);
>> +
>> +		if (i =3D=3D 0)
> Nit: switch() {}?
>> +			param_type_id =3D arg0_type_id;
>> +		else if (i =3D=3D 1)
>> +			param_type_id =3D arg1_type_id;
>> +		else
>> +			param_type_id =3D params[i].type;
>> +
>> +		err =3D btf__add_func_param(btf, name ?: "", param_type_id);
>> +		if (err < 0)
>> +			return err;
>> +	}
>> +
>> +	pr_debug("resolve_btfids: added arena-tagged proto for kfunc %s: %d\n"=
, kfunc->name, new_proto_id);
>> +
>> +	return new_proto_id;
>> +}
>> +
>> +static int process_kfunc_with_arena_flags(struct btf2btf_context *ctx, =
struct kfunc *kfunc)
>> +{
>> +	struct btf_type *t;
>> +	s32 proto_id;
>> +
>> +	proto_id =3D ensure_arena_tagged_proto(ctx->btf, kfunc);
>> +	if (proto_id < 0)
>> +		return proto_id;
>> +
>> +	t =3D (struct btf_type *)btf__type_by_id(ctx->btf, kfunc->btf_id);
>> +	t->type =3D proto_id;
>> +
>> +	return 0;
>> +}
>> +
>>  static int btf2btf(struct object *obj)
>>  {
>>  	struct btf2btf_context ctx =3D {};
>> @@ -1321,6 +1446,12 @@ static int btf2btf(struct object *obj)
>>  			if (err)
>>  				goto out;
>>  		}
>> +
>> +		if (kfunc->flags & (KF_ARENA_RET | KF_ARENA_ARG1 | KF_ARENA_ARG2)) {
>> +			err =3D process_kfunc_with_arena_flags(&ctx, kfunc);
>> +			if (err)
>> +				goto out;
>> +		}
>>  	}
>> =20
>>  	err =3D 0;

