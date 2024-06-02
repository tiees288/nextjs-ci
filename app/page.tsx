'use client';

import { useEffect } from "react";

export default function Home() {

  const fetchData = async () => {
    var host = process.env.API_URL;
    console.log("host", host);
    const res = await fetch(`${host}/api/v1/data/service-conditions`);
    const data = await res.json();
    console.log(data);
  }

  useEffect(() => {
    console.log("Hello its work");
    fetchData();
  }, []);

  return (
    <div className="flex flex-row justify-center">
      <h1>
        Hello Its work
      </h1>
    </div>
  );
}
